package com.xiaofei.jdParse.dataparse;

import java.sql.*;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;


public class code {
    public static void main(String[] args) {
        CreateTable();
        user_idf();
        System.out.println("*********");
        //job_idf();
        System.out.println("finish");
    }
    static PreparedStatement db;
    static Connection ct;
    static ResultSet rs,rs1;
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

    public static void CreateTable() {
        Connect();
        try {

            String sql = "CREATE TABLE if not exists `ourproject`.`user_idf` (\n" +
                    "  `word` VARCHAR(45) NOT NULL,\n" +
                    "  `idf` DOUBLE NOT NULL,\n" +
                    "  PRIMARY KEY (`word`),\n" +
                    "  UNIQUE INDEX `word_UNIQUE` (`word` ASC) VISIBLE);\n";
            db = ct.prepareStatement(sql);
            db.execute();
            sql = "CREATE TABLE if not exists `ourproject`.`job_idf` (\n" +
                    "  `word` VARCHAR(45) NOT NULL,\n" +
                    "  `idf` DOUBLE NOT NULL,\n" +
                    "  PRIMARY KEY (`word`),\n" +
                    "  UNIQUE INDEX `word_UNIQUE` (`word` ASC) VISIBLE);\n";
            db = ct.prepareStatement(sql);
            db.execute();
            sql = "CREATE TABLE if not exists `ourproject`.`learn1` (\n" +
                    "  `user_id` VARCHAR(45) NOT NULL,\n" +
                    "  `job_no` VARCHAR(45) NOT NULL,\n" +
                    "  `min_desire_salary` INT NOT NULL,\n" +
                    "  `max_desire_salary` INT NOT NULL,\n" +
                    "  `min_com_salary` INT NOT NULL,\n" +
                    "  `max_com_salary` INT NOT NULL,\n" +
                    "  `gt_max` INT NOT NULL,\n" +
                    "  `lt_min` INT NOT NULL,\n" +
                    "  `require` INT NOT NULL,\n" +
                    "  `same_com_desire` INT NOT NULL,\n" +
                    "  `same_com_live` INT NOT NULL,\n" +
                    "  `user_edu` INT NOT NULL,\n" +
                    "  `com_edu` INT NOT NULL,\n" +
                    "  `gt_edu` INT NOT NULL,\n" +
                    "  `len_exp` INT NOT NULL,\n" +
                    "  `eff_exp_cnt` INT NOT NULL,\n" +
                    "  `eff_exp_ratio` DOUBLE NOT NULL,\n" +
                    "  `cos_tfidf` DOUBLE NOT NULL,\n" +
                    "  `satisfied` INT NOT NULL,\n" +
                    "  `browsed` INT NOT NULL);\n";
            db = ct.prepareStatement(sql);
            db.execute();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    public static void close() {
        try {
            if (rs != null)
                rs.close();
            if (db != null)
                db.close();
            if (ct != null)
                ct.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void user_idf() {
        String c_word = "";
        String[] s;
        int num = 0;
        double value = 0;
        Connect();
        try {
            HashSet<String> content = new HashSet<>();
            HashMap<String, Integer> idf = new HashMap<>();
            String sql = "select experience,desire_jd_type_id,cur_jd_type from ourproject.user";
            db = ct.prepareStatement(sql);
            rs = db.executeQuery();
            while (rs.next()) {
                num++;
                content = management.Split(rs.getString(1));

                for (String s1 : content) {
                    if (!idf.containsKey(s1)) {
                        idf.put(s1, 1);
                    } else {
                        idf.put(s1, idf.get(s1) + 1);
                    }

                }
                content.clear();
            }
            try {
                for (Map.Entry<String, Integer> item : idf.entrySet()) {
                    c_word = item.getKey();
                    if (c_word.length() < 20 && c_word.length() > 1) {
                        sql = "insert into ourproject.user_idf values(?,?)";
                        db = ct.prepareStatement(sql);
                        word = item.getKey();
                        db.setString(1,c_word);
                        value = Math.log10(num / (item.getValue() + 1));
                        db.setDouble(2, value);
                        db.executeUpdate();
                    }

                }

            } catch (Exception e) {
                System.out.println(word);
            }


        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public static void job_idf() {
        String[] s;
        int num = 0;
        double value = 0;
        String c_word = "";
        Connect();

        try {
            HashSet<String> content;
            HashMap<String, Integer> idf =  new HashMap<String, Integer>();
            String sql = "select job_description,jd_title,jd_sub_type from ourproject.jd";
            db = ct.prepareStatement(sql);
            rs = db.executeQuery();
            while (rs.next()) {
                num++;
                content = management.Split(rs.getString(1)+rs.getString(2)+rs.getString(3));

                for (String s1 : content) {
                    if (!idf.containsKey(s1)) {
                        idf.put(s1, 1);
                    } else {
                        idf.put(s1, idf.get(s1) + 1);
                    }

                }
                content.clear();
                if (num % 100 == 0) {
                    System.out.println(num);
                }
            }
            System.out.println("search finished");
            try {
                int num1 = 0;

                //System.out.println();
                for (Map.Entry<String, Integer> item : idf.entrySet()) {
                    num1++;
                    c_word = item.getKey();
                    if (c_word.length() < 20 && c_word.length() > 1) {
                        sql = "insert into ourproject.job_idf values(?,?)";
                        db = ct.prepareStatement(sql);
                        word = item.getKey();
                        db.setString(1, c_word);
                        value = Math.log10(num / (item.getValue() + 1));
                        db.setDouble(2, value);
                        db.executeUpdate();
                    }
                    if (num1 % 100 == 0) {
                        System.out.println(num1);
                    }
                }

            } catch (Exception e) {
                System.out.println(word);
            }


        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close();
        }
    }
}