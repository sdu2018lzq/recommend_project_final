package com.xiaofei.jdParse.dataparse;

import java.sql.*;

public class database {
    static PreparedStatement db;
    static Connection ct;
    static ResultSet rs;
    static String word = "";
    public static void Connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?user=root&&password=password&&"
                    + "useUnicode=true&&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false"
                    + "&serverTimezone=UTC&characterEncoding=UTF-8&useSSL=false&&allowPublicKeyRetrieval=true");
        } catch (ClassNotFoundException | SQLException e) {

            e.printStackTrace();
        }
    }

    public static double getIdf(String s){
        Connect();
        double idf = 0;
        String sql = "select user_idf from ourproject.user_idf where word=?";
        try {
            db = ct.prepareStatement(sql);
            db.setString(1, s);
             rs = db.executeQuery();

            while (rs.next()) {
                idf = rs.getDouble(1);
                System.out.println(idf);
            return idf;
            }
            }catch (Exception e) {
            System.out.println(word);
        }
        return  idf;
        }
    }

