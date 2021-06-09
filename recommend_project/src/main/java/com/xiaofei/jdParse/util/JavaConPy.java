package com.xiaofei.jdParse.util;

import java.io.*;
import java.util.HashSet;
import java.util.Iterator;

public class JavaConPy {
    public static void main(String[] args)  throws IOException, InterruptedException{
        String exe = "python ";
        String command = "E:\\Desktop\\recommend_project\\py\\51jobjava_2.py";
        String minpay = "1200000";
        String maxpay = "1800000";
        String citygo = "北京";
        String citylive = "北京";
        String degree = "大专";
        String txt = "1、 负责法大大电子合同平台SaaS服务的推广、销售工作，负责区域或者行业的销售任务完成，对业绩目标达成负责；" +
                "2、 通过行业、协会、论坛等场合，对法大大产品进行现场演示、推介、交流需求合作；" +
                "3、 负责对市场不同阶段的市场规划以及重点项目、重点市场的推进以及做好客情维护；" +
                "4、 负责客户汇报方案的组织编写及汇报工作，完成项目标书的编写及投标工作，后期也能协调公司内部跟踪产品对接上线及后期运营情况。" +
                "5、负责监测、搜集、整理和分析各种市场信息，及时了解和总结市场反馈，对产品迭代给出建议，为公司提供决策建议。任职要求：" +
                "1、 大专以上学历，通信工程、计算机、电子类、市场营销等专业优先，对软件、服务、网络等IT领域有基本了解优先； " +
                "2、至少2年以上2B的销售经验，任职期间业绩TOP者优先；有法律、技术背景优先考虑，对移动互联网和SAAS市场有一定的理解优先；" +
                "3、有在企业级客户及KA方向有工作经验的优先考虑、有一定行业经验/人脉资源，熟悉金融或医疗行业优先；" +
                "4、 为人诚实正直、学习能力强、善于整合资源、工作勤奋、有韧性、富有工作热情、具备良好的职业道德、有强烈的目标意识与进取精神";
        String industry = "软件工程";
        String[] cmdArr = new String[]{exe, command, minpay, maxpay, citygo, citylive, degree, txt, industry};
        Process process = Runtime.getRuntime().exec(cmdArr);
//        InputStream is = process.getInputStream();
//        DataInputStream dis = new DataInputStream(is);
//        String str = dis.readLine();
//        process.waitFor();
//        System.out.println(str);
        BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line = null;
        String[] job = new String[20];
        int i = 0;
        while ((line = in.readLine()) != null) {
            System.out.println(line);
            job[i] = line;
            i++;
            if (i > 20) {
                break;
            }
        }
        in.close();
        process.waitFor();

        //job存在stirng数组job中，有20个

        System.out.println("!!!!!joblist!!!!!");
        for (int j = 0; j < 20; j++) {
            System.out.println("no." + (j + 1) + "  jobid:  " + job[j]);
        }

    }


    public static String[] Py(String minpay, String maxpay, String citygo,String  citylive,String  degree,String  txt,String  industry) throws IOException, InterruptedException {
        String exe = "python ";
        String command = "E:\\Desktop\\recommend_project\\py\\51jobjava_2.py";

//        String minpay = "1200000";
//        String maxpay = "1800000";
//        String citygo = "北京";
//        String citylive = "北京";
//        String degree = "大专";
//        String txt = "1、 负责法大大电子合同平台SaaS服务的推广、销售工作，负责区域或者行业的销售任务完成，对业绩目标达成负责；" +
//                "2、 通过行业、协会、论坛等场合，对法大大产品进行现场演示、推介、交流需求合作；" +
//                "3、 负责对市场不同阶段的市场规划以及重点项目、重点市场的推进以及做好客情维护；" +
//                "4、 负责客户汇报方案的组织编写及汇报工作，完成项目标书的编写及投标工作，后期也能协调公司内部跟踪产品对接上线及后期运营情况。" +
//                "5、负责监测、搜集、整理和分析各种市场信息，及时了解和总结市场反馈，对产品迭代给出建议，为公司提供决策建议。任职要求：" +
//                "1、 大专以上学历，通信工程、计算机、电子类、市场营销等专业优先，对软件、服务、网络等IT领域有基本了解优先； " +
//                "2、至少2年以上2B的销售经验，任职期间业绩TOP者优先；有法律、技术背景优先考虑，对移动互联网和SAAS市场有一定的理解优先；" +
//                "3、有在企业级客户及KA方向有工作经验的优先考虑、有一定行业经验/人脉资源，熟悉金融或医疗行业优先；" +
//                "4、 为人诚实正直、学习能力强、善于整合资源、工作勤奋、有韧性、富有工作热情、具备良好的职业道德、有强烈的目标意识与进取精神";
//        String industry = "软件工程";
        String[] cmdArr = new String[]{exe, command, minpay, maxpay, citygo, citylive, degree, txt, industry};
        Process process = Runtime.getRuntime().exec(cmdArr);
//        InputStream is = process.getInputStream();
//        DataInputStream dis = new DataInputStream(is);
//        String str = dis.readLine();
//        process.waitFor();
//        System.out.println(str);
        BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line = null;
        String[] job = new String[40];
        HashSet<String> hashSet=new HashSet<String>();
        int i = 0;
        while ((line = in.readLine()) != null) {
            System.out.println(line);
            job[i]=line;
            i++;
            if (i > 40) {
                break;
            }
        }

        in.close();
        process.waitFor();



        System.out.println("!!!!!joblist!!!!!");
        for (int j = 0; j < 40; j++) {
            System.out.println("no." + (j + 1) + "  jobid:  " + job[j]);
        }
       return job;
    }

}
