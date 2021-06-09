package com.xiaofei.jdParse.parser;

import com.xiaofei.jdParse.AbstractResumeParser;
import com.xiaofei.jdParse.Resume;
import com.xiaofei.jdParse.ResumeParser;
import com.xiaofei.jdParse.resume.LagouResume;
import com.xiaofei.jdParse.util.PdfUtils;

import java.io.File;
import java.io.FileInputStream;
import java.util.Calendar;

/**
 * 简历解析
 */
public class LagouPdfResumeParser extends AbstractResumeParser implements ResumeParser {
  
  private static final String JOB_COMPANY_SPLIT = "·";
  private static final String BASIC_INFO_SPLIT = "︳";
  
  @Override
  public String getName() {
    return "拉勾PDF";
  }
  
  @Override
  public boolean canParse(File file) {
    if(file == null) {
      return false;
    } else {
      String name = file.getName();
      return name.endsWith(".pdf") || (name.startsWith("拉勾-") && name.endsWith(".pdf"));
    }
  }

  @Override
  public Resume parse(File file) throws Exception {

    boolean startedBasic = false;
    boolean startEducation = false;
    boolean startWork = false;
    String nextEducation = null;
    String nextWork = null;
    StringBuffer sb1=new StringBuffer();
    StringBuffer sb2=new StringBuffer();
    LagouResume resume = new LagouResume();
    String[] lines = PdfUtils.parsePdf2Text(new FileInputStream(file)).split("\n");

    for(String text : lines) {
//      System.out.println("*******");
//      System.out.println(text);
//      System.out.println("*******");

      if(isNullOrEmpty(text)) {
        continue;
      }
      
      if(!startedBasic) {
        // 第一个还未开始的非空字符串是：姓名
        resume.setName(text.trim());
        startedBasic = true;
      }
      else if(text.contains("本人")||text.contains("性格")||text.contains("喜欢")
              ||text.contains("爱")||text.contains("精神")||text.contains("心")
              ||text.contains("兴趣")
      )
      {
        System.out.println(text);
        sb1.append(text);

      }
      else if(
              text.contains("技术")||text.contains("熟")||text.contains("掌握")
      ||text.contains("了解")||text.contains("能够")||text.contains("技能")||text.contains("能力")
      ) {
        System.out.println(text);
        sb2.append(text);
      }


      else if(text.contains("工作经历")) {
        System.out.println(text);
        startEducation = false;
        startWork = true;
        nextWork = "上家公司";
      }
      else if(text.contains("教育经历")) {
        startEducation = true;
        startWork = false;
        nextEducation = "学校";
      } else if(!startEducation && !startWork) {
        if(text.contains(JOB_COMPANY_SPLIT)) {
          parseJobAndCompany(resume, text);
        } else if(text.indexOf(BASIC_INFO_SPLIT) >= 0) {
          // 其他基本信息
          parsePersonalInfo(resume, text);
        }
      } else if(startWork) {


        if("上家公司".equals(nextWork)) {
          resume.setCompany(text);
          nextWork = "上家岗位";
        } else if("上家岗位".equals(nextWork)) {
          int blankIndex = text.indexOf(" ");
          if(blankIndex > 0) {
            resume.setJob(text.substring(0, blankIndex));
          }
        }
      }

      else if(startEducation) {
        // 解析教育经历

        if("学校".equals(nextEducation)) {
          resume.setSchool(text);
          nextEducation = "学历";

        }


        else if("学历".equals(nextEducation)) {
          int index = text.indexOf(JOB_COMPANY_SPLIT);
          if(index > 0) {
            String edu = text.substring(0, index).trim();
            for(String e : EDUCATIONS.keySet()) {
              if(edu.startsWith(e)) {
                edu = e;
                break;
              }
            }
            resume.setEducation(edu);
          } else {
            resume.setEducation("");
          }

          if(resume.getSchool() != null && !EDUCATIONS.containsKey(resume.getEducation())) {
            // 学历未设置的情况，假设是本科
            resume.setEducation("本科");
          }

          if(EDUCATIONS.containsKey(resume.getEducation())) {
            int indexN = text.indexOf("年");
            if(indexN > 0) {
              try {
                // 解析毕业年份
                int end = Integer.parseInt(text.substring(indexN - 4, indexN));
                Integer age = Calendar.getInstance().get(Calendar.YEAR) - end + EDUCATIONS.get(resume.getEducation());
                resume.setAge(age.toString());
              } catch(Exception e) {}
            }
            //break;
          }
        }
      }
    }
    resume.setxingge(sb1.toString());
    resume.setjineng(sb2.toString());
    resume.setXgTFIDF(fenciTFIDF.getTFIDF(sb1.toString()));
    resume.setJnTFIDF(fenciTFIDF.getTFIDF(sb2.toString()));
    return resume;
  }
  
  protected void parseJobAndCompany(LagouResume resume, String jobAndCompany) {
    int index = jobAndCompany.indexOf(JOB_COMPANY_SPLIT);
    int length = jobAndCompany.length();
    if(index < 0) {
      resume.setJob(jobAndCompany);
    } else if(index == 0 && length >= 2) {
      resume.setCompany(jobAndCompany.substring(1));
    } else if(index + 1 == length) {
      resume.setJob(jobAndCompany.substring(0, index));
    } else {
      resume.setJob(jobAndCompany.substring(0, index));
      resume.setCompany(jobAndCompany.substring(index + 1));
    }
  }

  protected void parsePersonalInfo(LagouResume resume, String text) {
    String[] values = text.split(BASIC_INFO_SPLIT);
    
    String next = null;
    
    for(String value : values) {
      String str = value.trim();
      if(str.contains("工作经验")) {
        int index = str.indexOf("年");
        if(index > 0) {
          resume.setWorkDuration(str.substring(0, index));
        } else {
          resume.setWorkDuration(str.substring(0, str.indexOf("工作经验")));
        }
        next = "城市";
      } else if(str.contains("应届")) {
        resume.setWorkDuration("0");
        next = "城市";
      }
      else if("城市".equals(next)){
        resume.setCity(str);}
      else if(str.contains("男")) {
        resume.setSex("男");
        next = "学历";
      } else if(str.contains("女")) {
        resume.setSex("女");
        next = "学历";
      } else if(str.contains("@")) {
        resume.setMail(str);
      } else if(str.startsWith("1") && str.length() >= 11) {
        // TODO 对电话的解析值得商榷
        resume.setPhone(str);

      }
        if("学历".equals(next)){
        resume.setEducation(str);

      }

    }
  }
}
