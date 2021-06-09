package com.xiaofei.jdParse.dataparse;


import java.sql.*;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import static com.xiaofei.jdParse.dataparse.management.*;


public class ne {
    PreparedStatement db;
    Connection ct;
    ResultSet rs,rs1;
    static String word = "";


    public void Connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?user=root&&password=password&&"
                    + "useUnicode=true&&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false"
                    + "&serverTimezone=UTC&characterEncoding=UTF-8&useSSL=false&&allowPublicKeyRetrieval=true");
        } catch (ClassNotFoundException | SQLException e) {

            e.printStackTrace();
        }
    }

    public void CreateTable() {
        Connect();
        try {

            String sql = "CREATE TABLE if not exists `ourproject`.`user_idf` (\n" +
                    "  `word` VARCHAR(45) NOT NULL,\n" +
                    "  `idf` DOUBLE NULL,\n" +
                    "  PRIMARY KEY (`word`));\n";
            db = ct.prepareStatement(sql);
            db.execute();
//            sql = "CREATE TABLE if not exists `ourproject`.`job_idf` (\n" +
//                    "  `word` VARCHAR(45) NOT NULL,\n" +
//                    "  `idf` DOUBLE NULL,\n" +
//                    "  PRIMARY KEY (`word`));\n";
//            db = ct.prepareStatement(sql);
//            db.execute();
//            sql = "CREATE TABLE  if not exists `ourproject`.`learn63` (\n" +
//                    "  `user_id` VARCHAR(50) NOT NULL,\n" +
//                    "  `jd_no` VARCHAR(50) NOT NULL,\n" +
//                    "  `tf_multi_idf` DOUBLE NOT NULL,\n" +
//                    "  `tf_plus_idf` DOUBLE NOT NULL,\n" +
//                    "  `tf_cos_idf` DOUBLE NOT NULL,\n" +
//                    "  `tf_job_idf` DOUBLE NOT NULL,\n" +
//                    "  `tf_user_idf` DOUBLE NOT NULL,\n" +
//                    "  `degree` INT NOT NULL,\n" +
//                    "  `salary` INT NOT NULL,\n" +
//                    "  `city` INT NOT NULL,\n" +
//                    "  `satisfied` INT NOT NULL);\n";
//            db = ct.prepareStatement(sql);
//            db.execute();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    public void close() {
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

    public void user_idf() {
        String c_word = "";
        String[] s;
        int num = 0;
        double value = 0;
        Connect();
        try {
            HashSet<String> content = new HashSet<>();
            HashMap<String, Integer> idf = new HashMap<>();
            String sql = "select experience from ourproject.user";
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
                        db.setString(1, c_word);
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

    public void job_idf() {
        String[] s;
        int num = 0;
        double value = 0;
        String c_word = "";
        Connect();

        try {
            HashSet<String> content = new HashSet<>();
            HashMap<String, Integer> idf = new HashMap<>();
            String sql = "select job_description from ourproject.jd limit 10000";
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
                if (num % 100 == 0) {
                    System.out.println(num);
                }
            }
            System.out.println("search finished");
            try {
                int num1 = 0;

                System.out.println();
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




    public void machine_learning() throws SQLException {
        Connect();
        String sql = "SELECT * FROM ourproject.res3";
        db = ct.prepareStatement(sql);
        rs1= db.executeQuery();

        double jidf,uidf,jtfidf,utfidf;
        String city;
        int i=0;
        String desire_city[]=new String[3];
        double cos=0;
        while(rs1.next()){
            i++;
            vector v=new vector();
            //
            v.setUser_id(rs1.getString(1));
            v.setJd_no(rs1.getString(2));

            v.setSatisfied(rs1.getInt(3));
            //
            desire_city=rs1.getString(4).split(",");
            city=rs1.getString(8);
            if(desire_city[0].equals(city)||desire_city[1].equals(city)||desire_city[2].equals(city)){
                v.setCity(1);
            }
            //
            v.setDegree(score(rs1.getString(6))+score(rs1.getString(11)));
           //System.out.println(score(rs1.getString(6))+"+|"+score(rs1.getString(11)));
            //
            v.setSalary(salary(rs1.getInt(9)+rs1.getInt(10))-salary(rs1.getString(5)));
            //System.out.println(rs.getString(9)+rs.getString(10));
            //System.out.println(salary(rs.getString(5)));



            //last step
            HashMap<String, double[]> match = match(rs1.getString(7), rs1.getString(12));

            for (Map.Entry<String, double[]> word : match.entrySet()) {
                sql="select jidf,uidf from ourproject.res2 where word=?";
                db=ct.prepareStatement(sql);
                db.setString(1,word.getKey());
                rs=db.executeQuery();
                if(rs.next()) {
                    jidf = rs.getDouble(1);
                    uidf = rs.getDouble(2);
                    jtfidf = jidf * word.getValue()[1];
                    utfidf = uidf * word.getValue()[0];

                    v.setTf_multi_idf(jtfidf * utfidf);
                    v.setTf_plus_idf((jtfidf + utfidf));
                    v.setTf_a_idf(jtfidf*jtfidf);//+j方
                    v.setTf_b_idf(utfidf*utfidf);//+u方
                }
            }

            //
            sql = "insert into ourproject.learn63 values(?,?,?,?,?,?,?,?,?,?,?)";
            db = ct.prepareStatement(sql);
            //System.out.println((v.getTf_multi_idf())/(Math.sqrt(v.getTf_a_idf())*Math.sqrt(v.getTf_b_idf())));
            db.setString(1, v.getUser_id());
            db.setString(2, v.getJd_no());
            db.setDouble(3, v.getTf_multi_idf());
            db.setDouble(4, v.getTf_plus_idf());
if(Math.sqrt(v.getTf_a_idf())*Math.sqrt(v.getTf_b_idf())!=0){
    cos=(v.getTf_multi_idf())/(Math.sqrt(v.getTf_a_idf())*Math.sqrt(v.getTf_b_idf()));
}else{
    cos=0;
}

            db.setDouble(5, cos);
            db.setDouble(6, Math.sqrt(v.getTf_a_idf()));
            db.setDouble(7, Math.sqrt(v.getTf_b_idf()));
            db.setInt(8, v.getDegree());
            db.setInt(9, v.getSalary());
            db.setInt(10, v.getCity());
            db.setInt(11, v.getSatisfied());
            db.executeUpdate();
            //
            if(i%100==0){
                System.out.println(i);
           }

        }
    }


//select
//    public int matchUserName(String a) {
//        int i = 0;
//        Connect();
//        try {
//            String username = a;
//            String sql = "select * From homework.users";
//            db = ct.prepareStatement(sql);
//            rs = db.executeQuery();
//            while (rs.next()) {
//                if (username.equals(rs.getString(1))) {
//                    i = 1;
//
//                }
//            }
//        } catch (Exception e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//
//        finally {
//        }
//        return i;
//
//    }

//    // insert
//    public int addUser(String e1, String g1, String h1, String i1) {
//        Connect();
//        String j = "0";
//        int i = 0;
//        try {
//            String k = "2";
//            String sql = "insert into homework.users values (?,?,?,?,?,?)";
//            db = ct.prepareStatement(sql);
//            db.setString(1, e1);
//            db.setString(2, g1);
//            db.setString(3, h1);
//            db.setString(4, i1);
//            db.setString(5, j);
//            db.setString(6, k);
//            i = db.executeUpdate();
//
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } finally {
//            close();
//        }
//        return i;
//    }


//
//    public void addAdministrator(String a) {
//        Connect();
//        try {
//            String SetRAccount = a;
//            String sql = "Update homework.users set rights=1 where accounts=" + SetRAccount + "";
//            db = ct.prepareStatement(sql);
//            db.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close();
//        }
//    }


//    public void clearCon(String Classes) {
//        Connect();
//        try {
//            String Classes1 = Classes;
//            String sql1 = "delete from homework.vote where classes=" + Classes1 + "";
//            db = ct.prepareStatement(sql1);
//            db.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close();
//        }
//    }
}