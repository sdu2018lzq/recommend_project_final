package com.xiaofei.jdParse.util;



import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import java.io.FileInputStream;
import java.util.HashMap;

/**
 * Author: 灵枢
 * Date: 2018/12/05
 * Time: 17:21
 * Description:读取Excel数据
 */
public class ExcelData {
    private HSSFSheet sheet;

    /**
     * 构造函数，初始化excel数据
     * @param filePath  excel路径
     * @param sheetName sheet表名
     */
    ExcelData(String filePath,String sheetName){
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(filePath);
            HSSFWorkbook sheets = new HSSFWorkbook(fileInputStream);
            //获取sheet
            sheet = sheets.getSheet(sheetName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据行和列的索引获取单元格的数据
     * @param row
     * @param column
     * @return
     */
    public String getExcelDateByIndex(int row,int column){
        HSSFRow row1 = sheet.getRow(row);
        String cell = row1.getCell(column).toString();
        return cell;
    }



    //测试方法
    public static HashMap<String, String> EXC(String filename){
        ExcelData sheet1 = new ExcelData("E:\\Desktop\\recommend_project\\处理结果\\"+filename, "简历处理结果");
        //获取第二行第4列
        HashMap hashMap=new HashMap();

        String cell0 = sheet1.getExcelDateByIndex(1, 0);
        String cell1 = sheet1.getExcelDateByIndex(1, 1);hashMap.put("name", cell1);
        String cell2 = sheet1.getExcelDateByIndex(1, 2);
      //  String cell3 = sheet1.getExcelDateByIndex(1, 3);//hashMap.put("name", cell1);
     //   String cell4 = sheet1.getExcelDateByIndex(1, 4);//hashMap.put("name", cell1);
        String cell4 = sheet1.getExcelDateByIndex(1, 4);hashMap.put("school", cell4);
        String cell5 = sheet1.getExcelDateByIndex(1, 5);hashMap.put("eduLevel", cell5);
        String cell7 = sheet1.getExcelDateByIndex(1, 7);//hashMap.put("name", cell1);
        String cell8 = sheet1.getExcelDateByIndex(1, 8);//hashMap.put("name", cell1);
        //String cell9 = sheet1.getExcelDateByIndex(1, 9);//hashMap.put("name", cell1);
        String cell9 = sheet1.getExcelDateByIndex(1, 9);hashMap.put("phone", cell9);
        String cell10 = sheet1.getExcelDateByIndex(1, 10);hashMap.put("email", cell10);
        String cell11 = sheet1.getExcelDateByIndex(1, 11);hashMap.put("sex", cell11);
        String cell12 = sheet1.getExcelDateByIndex(1, 12);hashMap.put("birth", cell12);
        String cell13 = sheet1.getExcelDateByIndex(1, 13);hashMap.put("city", cell13);
        String cell15 = sheet1.getExcelDateByIndex(1, 15);hashMap.put("hobby", cell15);
        String cell16 = sheet1.getExcelDateByIndex(1, 16);hashMap.put("skill", cell16);

        System.out.println(cell0);
        System.out.println(cell1);
            System.out.println(cell2);
            return hashMap;


    }
}

