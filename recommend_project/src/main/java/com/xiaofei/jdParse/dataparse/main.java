package com.xiaofei.jdParse.dataparse;

import java.sql.SQLException;

public class main {
    public static void main(String[] args) throws SQLException {
        ne db=new ne();
        db.CreateTable();
        db.user_idf();


        db.job_idf();
 //       System.out.println("finish");
//        HashMap<String, double[]> match = management.match("软件软件软件，资料","软件，资料");
//                for (Map.Entry<String, double[]> s : match.entrySet()) {
//            System.out.println(s.getKey()+"|"+s.getValue()[0]+"|"+s.getValue()[1]);


    }
}
