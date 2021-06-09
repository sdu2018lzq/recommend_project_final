package com.xiaofei.controller;

import com.xiaofei.jdParse.Main;
import com.xiaofei.jdParse.util.ExcelData;
import com.xiaofei.pojo.Jd;
import com.xiaofei.pojo.Sc;
import com.xiaofei.pojo.User;
import com.xiaofei.service.JdService;
import com.xiaofei.service.JdServiceImpl;
import com.xiaofei.service.UserServiceImpl;
import org.eclipse.jdt.internal.compiler.IErrorHandlingPolicy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private JdServiceImpl jdService;


    @RequestMapping("/login")
    public String login(String phoneNumber, String password, HttpSession session) {

        String uid = phoneNumber;
        User user = userService.findByUid(uid);
        if (user == null) {
            session.setAttribute("status", "用户未注册！");
            return "login1";
        }//未注册
        if (!password.equals(user.getPassword())) {
            session.setAttribute("status", "账户名或密码错误！");
            return "login1";
        }//密码不正确

//error 还需要写！！！！！！！！！！！！

        //登录成功：
        List<Sc> allMyCollections = JdServiceImpl.selSc(uid);
        session.setAttribute("allMyCollections", allMyCollections);
        session.setAttribute("user", user);

        session.setAttribute("isChange", "true");
        System.out.println("登录！");
        return "main";
    }

    @RequestMapping("/login1")
    public String login1(HttpSession session) {
        return "main";
    }

    @RequestMapping("/register")
    public String register(String username, String phoneNumber, String password, String passwordCheck, HttpSession session) {
        System.out.println(phoneNumber + "!!!!!!!!!");
        User u = userService.findByUid(phoneNumber);

        //账号是否已经被注册
        if (u != null) {
            return "error";
        }
        //判断两个密码是不是一样的
        if (!password.equals(passwordCheck)) {
            return "error";
        }

        //保存到数据库
        User user = new User();
        user.setUid(phoneNumber);
        user.setPassword(password);
        user.setName(username);
        userService.updateUser(user);

        session.setAttribute("isChange", "true");
        System.out.println(username + "   " + phoneNumber + "   " + password + "   " + passwordCheck);
        return "login";
    }


    @RequestMapping("/updateUser1")
    public String updateUser1(
            HttpSession session,
            @RequestParam("uid") String uid,
            @RequestParam("name") String name,
            @RequestParam("sex") String sex,
            @RequestParam("live_city") String live_city,
            @RequestParam("birthday") String birthday,
            @RequestParam("campus") String campus,
            @RequestParam("degree") String degree,
            @RequestParam("telephone") String phone,
            @RequestParam("mail") String mail

    ) {
        //信息存入数据库
        System.out.println("***********************" + name);

        System.out.println("***********************" + uid);
        User user = userService.findByUid(uid);
        System.out.println(user == null);
        user.setName(name);
        user.setSex(sex);
        user.setCity(live_city);
        user.setBirth(birthday);
        user.setCollege(campus);
        user.setEduLevel(degree);
        user.setPhone(phone);
        user.setEmail(mail);
        userService.updateUser(user);
        System.out.println(user);
        session.setAttribute("user", user);
        session.setAttribute("isChange", "true");
        return "page3";
    }

    @RequestMapping("/updateUser2")
    public String updateUser2(
            HttpSession session,
            @RequestParam("uid") String uid,
            @RequestParam("min_salary") long min_salary,
            @RequestParam("max_salary") long max_salary,
            @RequestParam("desire_city1") String desire_city1,
            @RequestParam("desire_city2") String desire_city2


    ) {
        //信息存入数据库

        User user = userService.findByUid(uid);

        user.setMinSal(min_salary);
        user.setMaxSal(max_salary);
        user.setHopecity1(desire_city1);
        user.setHopecity2(desire_city2);
        user.setAdjust("true");

        userService.updateUser(user);

        session.setAttribute("user", user);
        session.setAttribute("isChange", "true");
        return "page3";
    }


    @RequestMapping("/updateUser3")
    public String updateUser3(
            HttpSession session,
            @RequestParam("uid") String uid,
            @RequestParam("major_name") String major,
            @RequestParam("major_skill") String skill


    ) {
        //信息存入数据库

        User user = userService.findByUid(uid);

        user.setMajor(major);
        user.setSkill(skill);

        userService.updateUser(user);

        session.setAttribute("user", user);
        session.setAttribute("isChange", "true");
        return "page3";
    }


    @RequestMapping("/updateUser4")
    public String updateUser4(
            HttpSession session,
            @RequestParam("uid") String uid,
            @RequestParam("campus_exp") String campus_exp,
            @RequestParam("project_exp") String project_exp


    ) {
        //信息存入数据库

        User user = userService.findByUid(uid);

        user.setSchoolExp(campus_exp);
        user.setProjectExp(project_exp);

        userService.updateUser(user);
        session.setAttribute("user", user);
        session.setAttribute("isChange", "true");
        return "page3";
    }


    @RequestMapping("/updateUser5")
    public String updateUser5(
            HttpSession session,
            @RequestParam("uid") String uid,
            @RequestParam("habit_area") String habit
    ) {
        //信息存入数据库
        User user = userService.findByUid(uid);
        user.setHobby(habit);
        userService.updateUser(user);
        session.setAttribute("user", user);
        session.setAttribute("isChange", "true");
        return "page3";
    }


    @RequestMapping("/userCenter")
    public String userCenter(HttpSession session, String uid) {


        User user = userService.findByUid(uid);
        if (user == null) {
            return "error";
        }

        session.setAttribute("user", user);
        User u = (User) session.getAttribute("user");
        if (u == null) {
            return "index";
        }
        System.out.println("登录！");
        return "page3";

    }


    @RequestMapping("/uploadFile")
    public String uploadFile(@RequestParam("file") MultipartFile file,
                             @RequestParam("uid") String uid,
                             @RequestParam("password") String password
            , HttpSession session
    ) {
        // 获取文件名
        String fileOrigName = file.getOriginalFilename();

        String filepath = "E:\\Desktop\\recommend_project\\未处理简历\\" + fileOrigName;//文件存入当前项目的resources/satic/目录下
        try {
            File targetFile = new File(filepath);
            if (targetFile.exists()) {

            }

            //第一次上传时，如果目录不存在，创建目录
            if (!targetFile.getParentFile().exists()) {
                targetFile.getParentFile().mkdirs();

            }
            //将文件输出到本地
            File files = new File(filepath);
            try {
                if (!files.exists()) {                //如果文件不存在则新建文件
                    files.createNewFile();

                }
                FileOutputStream output = new FileOutputStream(files);

                byte[] bytes = file.getBytes();

                output.write(bytes);                //将数组的信息写入文件中

                output.close();

            } catch (IOException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        //生成解析excel
        String filename = Main.parse();
        //读excel
        HashMap<String, String> exc = ExcelData.EXC(filename);

        User user = userService.findByUid(uid);
        user.setName(exc.get("name"));
        user.setMajor(exc.get("major"));
        user.setCollege(exc.get("school"));
        user.setEduLevel(exc.get("eduLevel"));
        user.setPhone(exc.get("phone"));
        user.setEmail(exc.get("email"));
        user.setSex(exc.get("sex"));
        user.setBirth(exc.get("birth"));
        user.setCity(exc.get("city"));
        user.setHobby(exc.get("hobby"));
        user.setSkill(exc.get("skill"));
        userService.updateUser(user);
        session.setAttribute("user", user);
        if (exc.get("sex").equals("男")) {
            session.setAttribute("sex1", "男");
            session.setAttribute("sex2", "女");
        } else {
            session.setAttribute("sex1", "女");
            session.setAttribute("sex2", "男");
        }


        //  user
        return "redirect:/toProfile";

    }

    @RequestMapping("/ser")
    public String ser() {
        return "searchPage";
    }

}
