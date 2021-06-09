package com.xiaofei.jdParse.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.xiaofei.jdParse.Resume;

public class ExcelUtils {
  
  private static final String[] HEADERS = new String[]{
      "序号", "姓名", "应聘职位", "简历来源",       "毕业院校", 
      "学历", "年龄", "工龄",    "最后一家工作单位", "联系方式", 
      "邮箱", "性别", "生日",    "居住城市",       "地址"  ,"性格", "技能",
          "性格TFIDF", "技能TFIDF"
  };

  public static void outputResumeProcessResult(Map<File, Resume> map, File outFile) throws IOException {
    //工作簿
    HSSFWorkbook excel = new HSSFWorkbook();
    FileOutputStream fileoutputstream = new FileOutputStream(outFile);
    
    try {
      HSSFSheet sheet = excel.createSheet("简历处理结果");
      
      // 写表头
      HSSFRow headerRow = sheet.createRow(0);
      for(int i = 0; i < HEADERS.length; i++) {
        headerRow.createCell(i).setCellValue(HEADERS[i]);
      }
      
      // 写内容
      int rowNum = 1;
      for(Map.Entry<File, Resume> entry : map.entrySet()) {
        Resume resume = entry.getValue();
        HSSFRow row = sheet.createRow(rowNum);
        row.createCell(0).setCellValue(rowNum);                    // 序号
        row.createCell(1).setCellValue(resume.getName());          // 姓名
        row.createCell(2).setCellValue(resume.getJob());          // 应聘职位
        row.createCell(3).setCellValue(resume.getSource());        // 简历来源
        row.createCell(4).setCellValue(resume.getSchool());        // 毕业院校
        row.createCell(5).setCellValue(resume.getEducation());    // 学历
        row.createCell(6).setCellValue(resume.getAge());           // 年龄
        row.createCell(7).setCellValue(resume.getWorkDuration()); // 工作经验
        row.createCell(8).setCellValue(resume.getCompany());      // 现工作单位
        row.createCell(9).setCellValue(resume.getPhone());         // 电话
        row.createCell(10).setCellValue(resume.getMail());          // 邮箱
        row.createCell(11).setCellValue(resume.getSex());           // 性别
        row.createCell(12).setCellValue(resume.getBirthday());      // 生日
        row.createCell(13).setCellValue(resume.getCity());          // 居住城市
        row.createCell(14).setCellValue(resume.getAddress());       // 地址
        row.createCell(15).setCellValue(resume.getxingge());       // 性格
        row.createCell(16).setCellValue(resume.getjineng());       // 技能
        row.createCell(17).setCellValue(resume.getXgTFIDF().toString());       // 性格TFIDF
        row.createCell(18).setCellValue(resume.getJnTFIDF().toString());       // 技能TFIDF
        rowNum++;
      }
      excel.write(fileoutputstream);
    } finally {
      fileoutputstream.close();
      excel.close();
    }
  }
  
}
