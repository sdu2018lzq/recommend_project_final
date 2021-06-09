package com.xiaofei.jdParse.dataparse;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ReadCsv {

    public static void main(String[] args) {
        // 1. .csv文件的路径。注意只有一个\的要改成\\
        File csv = new File(
                "E:\\Desktop\\gangweimiaoshu.csv"); // CSV文件路径
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String line = "";
        String everyLine = "";
        try {
            List<String> allString = new ArrayList<>();
            while ((line = br.readLine()) != null) // 读取到的内容给line变量
            {
                everyLine = line;
                System.out.println(everyLine);
            //    System.out.println(岗位描述处理.getTFIDF(everyLine));
                allString.add(everyLine);
            }
            System.out.println("csv表格中所有行数：" + allString.size());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}