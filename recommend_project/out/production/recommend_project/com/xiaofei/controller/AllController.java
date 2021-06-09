package com.xiaofei.controller;
import com.xiaofei.jdParse.util.JavaConPy;
import com.xiaofei.pojo.Analysedata;
import com.xiaofei.pojo.Jd;
import com.xiaofei.pojo.Sc;
import com.xiaofei.pojo.User;
import com.xiaofei.service.JdServiceImpl;
import com.xiaofei.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

@Controller
public class AllController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private JdServiceImpl jdService;

    @RequestMapping("/toLogin")
    public String toLogin(HttpSession session) {
        return "login";
    }
    @RequestMapping("/toRegister")
    public String toRegister(HttpSession session) {
        return "register";
    }

    @RequestMapping("/toAboutUs")
    public String toAboutUs(HttpSession session) {
        return "aboutus";
    }

    @RequestMapping("/toRecommendPageTWO{pageId}")
    public String toRecommendPageTWO(@PathVariable int pageId, HttpSession session) {

        User u=userService.findByUid( ((User)session.getAttribute("user")).getUid());
        if(u.getCity()==null||u.getCity().length()<1||
                u.getSkill()==null||u.getSkill().length()<1||
                u.getMaxSal()==0||
                u.getHopecity1()==null||u.getHopecity1().length()<1||
                u.getEduLevel()==null||u.getEduLevel().length()<1
                ||u.getMajor()==null||u.getMajor().length()<1
        )
        {
            return "noProfileFind";
        }

        String isChange = (String)session.getAttribute("isChange");
        if(isChange.equals("false")){return "recommendPage";}
        //如果page=0且简历修改过

        if(pageId==0){
            String[] py = null;
            try {
                String minpay =u.getMinSal()+"0000";
                String maxpay =u.getMaxSal()+"0000";
                String citygo =u.getHopecity1();
                String citylive =u.getCity();
                String  degree=u.getEduLevel();
                String  txt=u.getSkill()+u.getProjectExp();
                String  industry=u.getMajor();
                py = JavaConPy.Py( minpay,   maxpay,   citygo,   citylive,   degree,   txt,  industry);

            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            List<Jd> jdList = new ArrayList<>();
            HashMap<String,Integer> hashMap=new HashMap<>();
            int x=0;
            a:for (int i = 0; i < py.length ; i++) {
                Jd jd=jdService.findByPositionId(Integer.parseInt(py[i]));
                if(!hashMap.containsKey(jd.getPositionName()))
                {
                    hashMap.put(jd.getPositionName(), 1);
                    jdList.add(jdService.findByPositionId(Integer.parseInt(py[i])));
                    x++;
                    if(x>20)break a;
                }
                else
                {
                    hashMap.put(jd.getPositionName(),hashMap.get(jd.getPositionName())+1 );
                }


                System.out.println(Integer.parseInt(py[i]));
            }
            session.setAttribute("jdList1",jdList);
            session.setAttribute("rid", 1);
            int len1=0;
            if(jdList.size()%10==0){
                len1=jdList.size()/10;
            }else{
                len1=jdList.size()/10+1;
            }
            session.setAttribute("len1",len1 );
        }else{
            session.setAttribute("rid", pageId);

        }
        //更新状态位
        session.setAttribute("isChange", "false");
        return "recommendPage";
    }

    @RequestMapping("/toRecommendPage{pageId}")
    public String toRecommendPage(@PathVariable int pageId, HttpSession session) {

        User u=userService.findByUid( ((User)session.getAttribute("user")).getUid());
        System.out.println(u.getCity()+"0000000000000000000000000");
        if(u.getCity()==null||u.getCity().length()<1||
                u.getSkill()==null||u.getSkill().length()<1||
                u.getMaxSal()==0||
                u.getHopecity1()==null||u.getHopecity1().length()<1||
                u.getEduLevel()==null||u.getEduLevel().length()<1
        )
        {
            return "noProfileFind";
        }
        if(pageId==0){
            session.setAttribute("rid", 1);
        }else{
            session.setAttribute("rid", pageId);
        }



        return "wait";
    }

    @RequestMapping("/toSearchPage{pageId}")
    public String toSearchPage(@PathVariable int pageId,HttpSession session) {
        //这里从后端拿搜索到的jdList，放进session里面
        List<Jd> jdList=null;
        if(pageId==0) {
           jdList = jdService.findAll();
            session.setAttribute("jdList",jdList);
            session.setAttribute("cityName",null);
            session.setAttribute("industry",null);
            session.setAttribute("minSalary",null);
            int len=0;
            if(jdList.size()%10==0){
                len=jdList.size()/10;
            }else{
                len=jdList.size()/10+1;
            }
            session.setAttribute("len", len);
            session.setAttribute("id",1);
        }else{
            session.setAttribute("id",pageId);
        }



        return "searchPage";
    }
    //添加了内容
    @RequestMapping("/toDetailsPage{positionId}")
    public String toDetailsPage(@PathVariable int positionId, HttpSession session) {
        //根据某一岗位id获取到该条岗位信息详情，将jd放入session中
        System.out.println(positionId);
        Jd jd = jdService.findByPositionId(positionId);
        session.setAttribute("jd",jd);
        //查询session.getAttribute表有没有收藏这个岗位，有就把isCollection设为true，否则设为false
        User u =(User) session.getAttribute("user");
        boolean scOrNot = JdServiceImpl.isScOrNot(u.getUid(), positionId);
        System.out.println(scOrNot+"!!!!!!!!!!!!!!!!!!");
        session.setAttribute("isCollection",scOrNot);
        return "details";
    }

    @RequestMapping("/addToCollection{positionId}")
    public String addToCollection(@PathVariable int positionId, HttpSession session) {
        //根据id加入到数据库的收藏里面
        User u=(User) session.getAttribute("user");
        Jd jd = jdService.findByPositionId(positionId);
        JdServiceImpl.addSc(u.getUid(),jd);
        List<Sc> allMyCollections = JdServiceImpl.selSc(u.getUid());
        session.setAttribute("allMyCollections", allMyCollections);
        return "redirect:/toDetailsPage"+positionId;
    }
    @RequestMapping("/cancelCollection{positionId}")
    public String cancelCollection(@PathVariable int positionId, HttpSession session) {
        //删除收藏
        User u=(User) session.getAttribute("user");
        JdServiceImpl.canSc(u.getUid(),positionId);
        session.setAttribute("isCollection",false);
        List<Sc> allMyCollections = JdServiceImpl.selSc(u.getUid());
        session.setAttribute("allMyCollections", allMyCollections);
        return "redirect:/toDetailsPage"+positionId;
    }
    @RequestMapping("/selectCity{cityName}")
    public String selectCity(@PathVariable String cityName, HttpSession session) {
        //将cityName设为筛选城市
        if (cityName.equals("全部")) {
            cityName = null;
        }
        session.setAttribute("cityName",cityName);
        String minSalary =(String) session.getAttribute("minSalary");
        String industry =(String) session.getAttribute("industry");
        int minSal=0;
        if (minSalary!=null&&!minSalary.equals("全部")) {
            minSal=Integer.parseInt(minSalary);
        }
        List<Jd> jdList = jdService.findByNamedParam(minSal,industry, cityName);
        session.setAttribute("jdList",jdList);
        session.setAttribute("id", 1);
        int len=0;
        if(jdList.size()%10==0){
            len=jdList.size()/10;
        }else{
            len=jdList.size()/10+1;
        }
        session.setAttribute("len", len);
        return "searchPage";
    }

    @RequestMapping("/selectIndustry{industry}")
    public String selectIndustry(@PathVariable String industry, HttpSession session) {
        //将industry设为筛选行业
        if (industry.equals("全部")) {
            industry = null;
        }
        session.setAttribute("industry", industry);
        //再通过城市、行业、最低薪资查找得出结果返回到list里面
        String minSalary =(String) session.getAttribute("minSalary");
        String cityName =(String) session.getAttribute("cityName");
        int minSal=0;
        if (minSalary!=null&&!minSalary.equals("全部")) {
            minSal=Integer.parseInt(minSalary);
        }
        List<Jd> jdList = jdService.findByNamedParam(minSal,industry , cityName);
        session.setAttribute("jdList",jdList);
        session.setAttribute("id", 1);
        int len=0;
        if(jdList.size()%10==0){
            len=jdList.size()/10;
        }else{
            len=jdList.size()/10+1;
        }
        session.setAttribute("len", len);
        return "searchPage";
    }

    @RequestMapping("/selectMinSalary{minSalary}")
    public String selectMinSalary(@PathVariable String minSalary, HttpSession session) {
        //将minSalary设为最低薪资
        int minSal=0;
        if (minSalary.equals("全部")) {
            minSalary = null;
        }else {
            minSal=Integer.parseInt(minSalary);
        }
        session.setAttribute("minSalary", minSalary);
        //再通过城市、行业、最低薪资查找得出结果返回到list里面
        String industry =(String) session.getAttribute("industry");
        String cityName =(String) session.getAttribute("cityName");
        List<Jd> jdList = jdService.findByNamedParam(minSal,industry , cityName);
        session.setAttribute("jdList",jdList);
        session.setAttribute("id", 1);
        int len=0;
        if(jdList.size()%10==0){
            len=jdList.size()/10;
        }else{
            len=jdList.size()/10+1;
        }
        session.setAttribute("len", len);
        return "searchPage";
    }


    @RequestMapping("/toProfile")
    public String page3(HttpSession session) {
        User u =(User) session.getAttribute("user");
        System.out.println(u);
        String uid = u.getUid();
//        String password=u.getPassword();
//        User user=userService.findByUid(uid);
//        if(user==null){ return "error"; }
//        if(!password.equals(user.getPassword())) {return  "error";}
//        User u= (User) session.getAttribute("user");
//        if(u==null) {
//            return "index";
//        }

        return "page3";

    }


    @RequestMapping("/toIndustryAnalyse{industry}")
    public String toIndustryAnalyse(@PathVariable String industry, HttpSession session) {
        List<Analysedata> analysedata = JdServiceImpl.selAnalysedata(industry);
        List<String> cityLabels = new ArrayList<>();
        List<String> cityName = new ArrayList<>();
        List<Integer> maxSalaryData = new ArrayList<>();
        List<Integer> minSalaryData = new ArrayList<>();
        for (int i = 0; i < analysedata.size(); i++) {
            Analysedata ana=analysedata.get(i);
            cityLabels.add('"'+ana.getAddress()+'"');
            cityName.add(ana.getAddress());
            maxSalaryData.add((int)ana.getMaxSalary());
            minSalaryData.add((int)ana.getMinSalary());
        }
//        cityLabels.add('"'+"北京"+'"');
//        cityLabels.add('"'+"深圳"+'"');
//        cityLabels.add('"'+"上海"+'"');
//        cityLabels.add('"'+"天津"+'"');
//        cityLabels.add('"'+"南京"+'"');
//        cityName.add("北京");
//        cityName.add("深圳");
//        cityName.add("上海");
//        cityName.add("天津");
//        cityName.add("南京");
//        maxSalaryData.add(159191);
//        maxSalaryData.add(138294);
//        maxSalaryData.add(134734);
//        maxSalaryData.add(125784);
//        maxSalaryData.add(124449);
//        minSalaryData.add(106332);
//        minSalaryData.add(90500);
//        minSalaryData.add(89423);
//        minSalaryData.add(85602);
//        minSalaryData.add(82029);
        session.setAttribute("industry",industry);
        session.setAttribute("cityLabelsList",cityLabels);
        session.setAttribute("cityNameList",cityName);
        session.setAttribute("maxSalaryData",maxSalaryData);
        session.setAttribute("minSalaryData",minSalaryData);
        session.setAttribute("isIndustry", true);
        return "industryAnalyse";
    }


    @RequestMapping("/toCityAnalyse{city}")
    public String toCityAnalyse(@PathVariable String city, HttpSession session) {

        List<Analysedata> analysedata = JdServiceImpl.selAnalysedataCity(city);
        List<String> cityLabels = new ArrayList<>();
        List<String> cityName = new ArrayList<>();
        List<Integer> maxSalaryData = new ArrayList<>();
        List<Integer> minSalaryData = new ArrayList<>();
        for (int i = 0; i < analysedata.size(); i++) {
            Analysedata ana=analysedata.get(i);
            cityLabels.add('"'+ana.getJobType()+'"');
            cityName.add(ana.getJobType());
            maxSalaryData.add((int)ana.getMaxSalary());
            minSalaryData.add((int)ana.getMinSalary());
        }
        session.setAttribute("city",city);
        session.setAttribute("cityLabelsList",cityLabels);
        session.setAttribute("cityNameList",cityName);
        session.setAttribute("maxSalaryData",maxSalaryData);
        session.setAttribute("minSalaryData",minSalaryData);
        session.setAttribute("isIndustry", false);
        return "industryAnalyse";
    }

}
