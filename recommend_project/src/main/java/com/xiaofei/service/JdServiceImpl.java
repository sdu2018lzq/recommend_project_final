package com.xiaofei.service;


import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.xiaofei.dao.JdDao;
import com.xiaofei.pojo.Analysedata;
import com.xiaofei.pojo.Jd;
import com.xiaofei.pojo.Sc;
import com.xiaofei.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class JdServiceImpl implements JdService {
    @Autowired
    private JdDao jdDao;




    @Override
    public List<Jd> findAll() {
        List<Jd> all = jdDao.findAll();
        return all;
    }

    @Override
    public Jd findByPositionId(long PositionId) {
        Jd byPositionId = jdDao.findByPositionId(PositionId);
        return byPositionId;
    }

 static int x=0;


    @Override
    public List<Jd> findByNamedParam(long minsal, String industry, String city) {
        List<Jd> byJobLike=new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");  // 加载驱动
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xiaofei",
                    "root", "password");  ////获取Connection对象


            if (con != null) {
                Statement stmt = null;
                ResultSet rs = null;
                String sql = "SELECT * FROM xiaofei.Jd j where 1=1";


                if (minsal > 0) {
                    sql += " and j.min_salary >="+minsal;
                }
                if (industry!=null&&industry.length() > 0) {
                    sql += " and j.job_type like'%"+industry+"%'";
                }
                if (city!=null&&city.length() > 0) {
                    sql += " and j.address like'%"+city+"%'";
                }



                stmt = con.createStatement();
                rs = stmt.executeQuery(sql);

               while (rs.next())
               {
                   Jd jd=new Jd();
                   jd.setPositionId(rs.getLong(1));
                   jd.setCompanyName(rs.getString(2));
                   jd.setAddress(rs.getString(3));
                   jd.setCompanyInfo(rs.getString(4));
                   jd.setPositionName(rs.getString(5));
                   jd.setJobDescription(rs.getString(6));
                   jd.setSalary(rs.getString(7));
                   jd.setMinSalary(rs.getInt(8));
                   jd.setMaxSalary(rs.getInt(9));
                   jd.setHeadCount(rs.getInt(10));
                   jd.setEducational(rs.getString(11));
                   jd.setWorkYear(rs.getLong(12));
                   jd.setCreateTime(rs.getString(13));
                   jd.setUrl(rs.getString(14));
                   jd.setJobType(rs.getString(15));
                   jd.setTfidf(rs.getString(16));
                   byJobLike.add(jd);

               }

            } else {
                System.out.println("Connection fail！");
            }
            con.close();
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println(e);
            System.out.println(x);
        }

        return byJobLike;

    }

    public static void addSc(String uid, Jd jd) {
        System.out.println(jd==null);
        try {
            Class.forName("com.mysql.jdbc.Driver");  // 加载驱动
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xiaofei",
                    "root", "password");  ////获取Connection对象
            String sql="insert into xiaofei.sc values(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql) ;
            pstmt.setString(1,uid);
            pstmt.setLong(2, jd.getPositionId());
            pstmt.setString(3,jd.getPositionName());
            pstmt.setString(4,jd.getCompanyName());
            pstmt.setString(5,jd.getAddress());
            pstmt.setString(6,jd.getJobType());
            pstmt.setLong(7,jd.getHeadCount());
            pstmt.setString(8,jd.getSalary());
            pstmt.executeUpdate();
            conn.close();
            } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println(e);
            System.out.println(x);
        }


    }
    public static void canSc(String uid, int positionId) {

        try {
            Class.forName("com.mysql.jdbc.Driver");  // 加载驱动
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xiaofei",
                    "root", "password");  ////获取Connection对象
            String sql="delete from xiaofei.sc where uid=? and jid=?";
            PreparedStatement pstmt = conn.prepareStatement(sql) ;
            pstmt.setString(1,uid);
            pstmt.setLong(2, positionId);
            pstmt.executeUpdate();
            conn.close();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println(e);
            System.out.println(x);
        }


    }

    public static boolean isScOrNot(String uid, int positionId) {
        ResultSet resultSet=null;
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");  // 加载驱动
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xiaofei",
                    "root", "password");  ////获取Connection对象
            String sql="select * from xiaofei.sc where uid=? and jid=?";
            PreparedStatement pstmt = conn.prepareStatement(sql) ;
            pstmt.setString(1,uid);
            pstmt.setLong(2, positionId);
            System.out.println(uid+"***************");
            System.out.println(positionId+"***************");
            resultSet = pstmt.executeQuery();

            try {
                if(resultSet.next()==false){
                    return false;
                }else{
                    return true;
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }


        } catch (Exception e) {

        }
        finally {
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return  false;
    }




    public static List<Sc> selSc(String uid) {
        List<Sc> list=new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");  // 加载驱动
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xiaofei",
                    "root", "password");  ////获取Connection对象
            String sql="select * from  xiaofei.sc where uid=?";
            PreparedStatement pstmt = conn.prepareStatement(sql) ;
            pstmt.setString(1,uid);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next())
            {
               Sc sc=new Sc();
               sc.setUid(rs.getString(1));
               sc.setJid(rs.getLong(2));
               sc.setPosName(rs.getString(3));
               sc.setCompName(rs.getString(4));
               sc.setCity(rs.getString(5));
               sc.setType(rs.getString(6));
               sc.setHc(rs.getLong(7));
               sc.setSal(rs.getString(8));
               list.add(sc);

            }
            conn.close();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println(e);
            System.out.println(x);
        }

        return list;
    }

    public static List<Analysedata> selAnalysedata(String industry) {
        List<Analysedata> list=new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");  // 加载驱动
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xiaofei",
                    "root", "password");  ////获取Connection对象
            String sql="select * from xiaofei.analysedata where job_type=? order by max_salary desc ";
            PreparedStatement pstmt = conn.prepareStatement(sql) ;
            pstmt.setString(1,industry);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next())
            {
                Analysedata ana=new  Analysedata();
                ana.setAddress(rs.getString(1));
                ana.setJobType(rs.getString(2));
                ana.setMaxSalary(rs.getDouble(3));
                ana.setMinSalary(rs.getDouble(4));

                list.add(ana);

            }
            conn.close();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println(e);
            System.out.println(x);
        }

        return list;
    }

    public static List<Analysedata> selAnalysedataCity(String city) {
        List<Analysedata> list=new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");  // 加载驱动
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xiaofei",
                    "root", "password");  ////获取Connection对象
            String sql="select * from xiaofei.analysedata where address=? order by max_salary desc ";
            PreparedStatement pstmt = conn.prepareStatement(sql) ;
            pstmt.setString(1,city);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next())
            {
                Analysedata ana=new  Analysedata();
                ana.setAddress(rs.getString(1));
                ana.setJobType(rs.getString(2));
                ana.setMaxSalary(rs.getDouble(3));
                ana.setMinSalary(rs.getDouble(4));

                list.add(ana);

            }
            conn.close();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println(e);
            System.out.println(x);
        }

        return list;
    }


}
