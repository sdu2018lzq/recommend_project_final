<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
    <meta name="author" content="AdminKit">
    <meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">

    <link rel="shortcut icon" href="/directory2/img/icons/icon-48x48.png"/>

    <title>个人简历</title>

    <link href="/directory2/css/app.css" rel="stylesheet">
    <!--    <link href="/directory2/css/amazeui.min.css" rel="stylesheet">-->
    <!--    <link href="/directory2/css/admin.css" rel="stylesheet">-->


    <style>
        /* Custom Styles */
        ul.nav-tabs {
            width: 140px;
            margin-top: 20px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
        }

        ul.nav-tabs li {
            margin: 0;
            border-top: 1px solid #ddd;
        }

        ul.nav-tabs li:first-child {
            border-top: none;
        }

        ul.nav-tabs li a {
            margin: 0;
            padding: 8px 16px;
            border-radius: 0;
        }

        ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover {
            color: #fff;
            background: #0088cc;
            border: 1px solid #0088cc;
        }

        ul.nav-tabs li:first-child a {
            border-radius: 4px 4px 0 0;
        }

        ul.nav-tabs li:last-child a {
            border-radius: 0 0 4px 4px;
        }

        ul.nav-tabs.affix {
            top: 30px; /* Set the top position of pinned element */
        }
    </style>
</head>

<body>
<div class="wrapper">
    <nav id="sidebar" class="sidebar">
        <div class="sidebar-content js-simplebar">
            <div class="nalika-profile" style="text-align: center;">
                <div class="profile-dtl">
                    <!--                    <a href="#"><img src="/directory2/img/xiaofei.png" alt="" /></a>-->
                    <div style="height: 40px"></div>
                    <a href="#">
                        <img src="/directory2/img/avatars/avatar.jpg" alt="" class="img-fluid rounded-circle mb-2"
                             width="128" height="128"/>
                    </a>
                    <a class="sidebar-brand" href="#">
                        <span class="align-middle" style="font-weight: 600; font-size: 1.5rem;
                        padding: 1.15rem 1.5rem; display: block; color: #f8f9fa">
                            ${sessionScope.user.getName()}</span>
                    </a>
                </div>
            </div>

            <ul class="sidebar-nav">

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/toRecommendPage0">
                        <i class="align-middle" data-feather="list"></i> <span class="align-middle">岗位推荐</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/selectCity上海">
                        <i class="align-middle" data-feather="eye"></i> <span class="align-middle">岗位搜索</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/toCityAnalyse北京">
                        <i class="align-middle" data-feather="bar-chart-2"></i> <span class="align-middle">行业分析</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="#ui" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="star"></i> <span class="align-middle">我的收藏</span>
                    </a>
                    <ul id="ui" class="sidebar-dropdown list-unstyled " data-parent="#sidebar">
                        <c:forEach var="myCollection" items="${sessionScope.allMyCollections}" varStatus="no">
                            <li class="sidebar-item">
                                <a class="sidebar-link"
                                   href="/toDetailsPage${myCollection.getJid()}"
                                   title="公司名：${myCollection.getCompName()}
工作城市：${myCollection.getCity()}
岗位类别：${myCollection.getType()}
薪资：${myCollection.getSal()}
">
                                        ${myCollection.getPosName()}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <!--                <li class="sidebar-item">-->
                <!--                    <a class="sidebar-link" href="pages-settings.html">-->
                <!--                        <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">退出登录</span>-->
                <!--                    </a>-->
                <!--                </li>-->

            </ul>
        </div>
    </nav>
    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle d-flex">
                <i class="hamburger align-self-center"></i>
            </a>
            <a href="#"><img src="/directory2/img/xiaofei.png" alt=""/></a>

            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align">
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                            <i class="align-middle" data-feather="settings"></i>
                        </a>

                        <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                            <img src="/directory2/img/avatars/avatar.jpg" class="avatar img-fluid rounded mr-1"
                                 alt="Charles Hall"/>
                            <span class="text-dark">Hi~ ${sessionScope.user.name} ${sessionScope.user.phone}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="/toProfile"><i class="align-middle mr-1"
                                                                          data-feather="user"></i> 我的简历</a>
                            <a class="dropdown-item" href="/login1"><i class="align-middle mr-1"
                                                                       data-feather="home"></i> 回到主页</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/toAboutUs"><i class="align-middle mr-1"
                                                                          data-feather="help-circle"></i> 帮助</a>
                            <a class="dropdown-item" href="/toLogin"><i class="align-middle mr-1"
                                                                        data-feather="log-out"></i> 退出登录</a>
                        </div>
                        `
                    </li>
                </ul>
            </div>
        </nav>

        <main class="content">
            <div class="container-fluid p-0">

                <h1 class="h3 mb-3">我的简历</h1>

                <div class="row">
                    <div class="col-md-3 col-xl-2">

                        <div class="card">

                            <div class="list-group list-group-flush" role="tablist">
                                <a class="list-group-item list-group-item-action active" data-toggle="list"
                                   href="#basicalInfo" role="tab">
                                    基本信息
                                </a>
                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#desires"
                                   role="tab">
                                    求职意向
                                </a>
                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#major"
                                   role="tab">
                                    专业特长
                                </a>
                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#experience"
                                   role="tab">
                                    个人经历
                                </a>
                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#habits"
                                   role="tab">
                                    兴趣爱好
                                </a>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <input style="display:none;" type="file" onchange="changImg(event)" id="imagechoose"
                                   name="food_img"/>
                            <%--                            <img id="aimage" onclick="ChooseImage()" height="120px" width="150px" src="/directory2/img/addpic1.png" />--%>

                            <form action="/uploadFile" method="post" enctype="multipart/form-data">
                                <input type="file" name="file">
                                <input type="submit" value="上传文件">
                                <input type=text style="display:none" name="uid" value="${sessionScope.user.getUid()}">
                                <input type=text style="display:none" name="password"
                                       value="${sessionScope.user.getPassword()}">
                            </form>

                        </div>


                    </div>

                    <div class="col-md-9 col-xl-10">
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="basicalInfo" role="tabpanel">
                                <div class="card">
                                    <div class="card-header">

                                        <h5 class="card-title mb-0">基本信息</h5>
                                    </div>
                                    <div class="card-body">
                                        <form action="/updateUser1" method="post">
                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-6">
                                                    <label for="name">姓名</label>
                                                    <input type="text" class="form-control" name="name" id="name"
                                                           placeholder="请输入姓名" value="${sessionScope.user.getName()}">
                                                    <input type=text style="display:none" name="uid"
                                                           value="${sessionScope.user.getUid()}">

                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="sex">性别</label>
                                                    <select name="sex" id="sex" class="form-control">
                                                                                                             <option selected>${sessionScope.user.sex}</option>--%>

                                                        <option>${sessionScope.sex1}</option>
                                                        <option>${sessionScope.sex2}</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-4">
                                                    <label for="live_city">居住城市</label>
                                                    <input type="text" class="form-control" name="live_city"
                                                           id="live_city" value="${sessionScope.user.getCity()}"
                                                           placeholder="请输入居住城市">
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="birthday">出生日期</label>
                                                    <input type="date" class="form-control" name="birthday"
                                                           id="birthday" value="${sessionScope.user.getBirth()}"
                                                    >
                                                </div>
                                            </div>


                                            <div class="form-row col-md-12">


                                                <div class="form-group col-md-5">
                                                    <label for="campus">就读院校</label>
                                                    <input type="text" class="form-control" name="campus" id="campus"
                                                           value="${sessionScope.user.getCollege()}"
                                                           placeholder="请输入就读院校">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="degree">学历</label>
                                                    <select id="degree" name="degree" class="form-control">
                                                        <option selected>${sessionScope.user.eduLevel}</option>

                                                        <c:if test="${sessionScope.user.eduLevel!='博士'}">
                                                            <option>博士</option>
                                                        </c:if>

                                                        <c:if test="${sessionScope.user.eduLevel!='硕士'}">
                                                            <option>硕士</option>
                                                        </c:if>

                                                        <c:if test="${sessionScope.user.eduLevel!='本科'}">
                                                            <option>本科</option>
                                                        </c:if>
                                                        <c:if test="${sessionScope.user.eduLevel!='大专'}">
                                                            <option>大专</option>
                                                        </c:if>
                                                        <c:if test="${sessionScope.user.eduLevel!='高中及以下'}">
                                                            <option>高中及以下</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-8">
                                                    <label for="telephone">联系电话</label>
                                                    <input type="text" class="form-control" id="telephone"
                                                           name="telephone" placeholder="请输入联系电话"
                                                           value="${sessionScope.user.getPhone()}"
                                                    >
                                                </div>

                                            </div>
                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-8">
                                                    <label for="mail">我的邮箱</label>
                                                    <input type="text" class="form-control" id="mail" name="mail"
                                                           placeholder="请输入邮箱" value="${sessionScope.user.getEmail()}"
                                                    >
                                                </div>
                                            </div>
                                            <div class="form-row col-md-12">
                                                <button type="submit" class="btn btn-primary">保存更改</button>

                                            </div>

                                        </form>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="desires" role="tabpanel">
                                <div class="card">
                                    <div class="card-header">

                                        <h5 class="card-title mb-0">求职意向</h5>
                                    </div>
                                    <div class="card-body">
                                        <form action="/updateUser2" method="post">
                                            <div class="form-row col-md-12">
                                                <h5>期望薪资</h5>
                                            </div>
                                            <div class="form-row col-md-12">

                                                <div class="form-group col-md-4">
                                                    <label for="min_salary">最低薪资(万/年)</label>
                                                    <input type="number" class="form-control" id="min_salary"
                                                           name="min_salary"
                                                           placeholder="期望最低薪资（万/年）"
                                                           value="${sessionScope.user.minSal}">
                                                    <input type=text style="display:none" name="uid"
                                                           value="${sessionScope.user.getUid()}">
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="max_salary">最高薪资(万/年)</label>
                                                    <input type="number" class="form-control" id="max_salary"
                                                           name="max_salary"
                                                           placeholder="期望最高薪资（万/年）"
                                                           value="${sessionScope.user.maxSal}">
                                                </div>
                                            </div>

                                            <div class="form-row col-md-12">
                                                <h5>期望工作城市</h5>
                                            </div>
                                            <div class="form-row col-md-12">

                                                <div class="form-group col-md-4">
                                                    <label for="desire_city1">期望城市1</label>
                                                    <input type="text" class="form-control" id="desire_city1"
                                                           name="desire_city1" placeholder="第一期望工作城市"
                                                           value="${sessionScope.user.hopecity1}">
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="desire_city2">期望城市2</label>
                                                    <input type="text" class="form-control" id="desire_city2"
                                                           name="desire_city2" placeholder="第二期望工作城市"
                                                           value="${sessionScope.user.hopecity2}">
                                                </div>

                                            </div>
                                            <div class="form-row col-md-12" style="display: inline">
                                                <div style="display: inline">
                                                    <%--                                                    <input type="checkbox" id="change_city">--%>

<%--                                                    <input type="checkbox" id="change_city"--%>
<%--                                                           name="change_city"--%>
<%--                                                           value="${sessionScope.user.adjust}">--%>
<%--                                                    <label for="change_city">是否接收城市调剂</label>--%>

                                                </div>
                                            </div>


                                            <div class="form-row col-md-12">
                                                <button type="submit" class="btn btn-primary">保存更改</button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="major" role="tabpanel">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">专业特长</h5>

                                        <form action="/updateUser3" method="post">
                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-6">
                                                    <label for="major_name">专业名称</label>
                                                    <input type="text" class="form-control" id="major_name"
                                                           name="major_name" placeholder="请输入就读专业的名称"
                                                           value="${sessionScope.user.major}">
                                                    <input type=text style="display:none" name="uid"
                                                           value="${sessionScope.user.getUid()}">
                                                </div>
                                            </div>
                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-12">
                                                    <label for="major_skill">专业技能</label>
                                                    <textarea rows="10" class="form-control" id="major_skill"
                                                              name="major_skill"
                                                              placeholder="填写掌握的专业技能，例如：熟练掌握java语言、英语CET6级550分">${sessionScope.user.skill}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-row col-md-12">
                                                <button type="submit" class="btn btn-primary">保存更改</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="experience" role="tabpanel">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">个人经历</h5>

                                        <form action="/updateUser4" method="post">
                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-12">
                                                    <label for="campus_exp">校园经历</label>
                                                    <textarea rows="10" class="form-control" id="campus_exp"
                                                              name="campus_exp"
                                                              placeholder="填写校园中的生活经历，例如学生会会长、街舞社成员">${sessionScope.user.schoolExp}</textarea>
                                                    <input type=text style="display:none" name="uid"
                                                           value="${sessionScope.user.getUid()}">
                                                </div>
                                            </div>
                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-12">
                                                    <label for="project_exp">项目经历</label>
                                                    <textarea rows="10" class="form-control" id="project_exp"
                                                              name="project_exp"
                                                              placeholder="填写参与的项目经历或实习经历">${sessionScope.user.projectExp} </textarea>
                                                </div>
                                            </div>
                                            <div class="form-row col-md-12">
                                                <button type="submit" class="btn btn-primary">保存更改</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="habits" role="tabpanel">
                                <div class="card">
                                    <div class="card-body">

                                        <form action="/updateUser5" method="post">
                                            <div class="form-row col-md-12">
                                                <div class="form-group col-md-12">
                                                    <label for="habit_area">兴趣爱好</label>
                                                    <textarea rows="10" class="form-control" id="habit_area"
                                                              name="habit_area"
                                                              placeholder="填写个人的兴趣爱好及在这方面的相关成就，例如：书法业余10级、钢琴业余10级、街舞协会会长">${sessionScope.user.hobby}</textarea>
                                                    <input type=text style="display:none" name="uid"
                                                           value="${sessionScope.user.getUid()}">
                                                </div>
                                            </div>
                                            <div class="form-row col-md-12">
                                                <button type="submit" class="btn btn-primary">保存更改</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <footer class="footer">
            <div class="container-fluid">
                <div class="row text-muted">
                    <div class="col-6 text-left">
                        <p class="mb-0">
                            <a href="index.html" class="text-muted"><strong>小飞智能</strong></a> &copy;
                        </p>
                    </div>
                    <div class="col-6 text-right">
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">关于我们</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="text-muted" href="/toAboutUs">帮助</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">回到顶部</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="/directory2/js/vendor.js"></script>
<script src="/directory2/js/app.js"></script>


<script>
    function changImg(e) {
        for (var i = 0; i < e.target.files.length; i++) {
            var file = e.target.files.item(i);
            //验证是否为图片，不是就跳出循环
            // if (!(/^image\/.*$/i.test(file.type))) {
            //     alert("请上传图片类型的文件（以.jpg，.png，.gif等为后缀结尾的文件）！")
            //     continue;
            // }
            //实例化FileReader API  
            var freader = new FileReader();
            freader.readAsDataURL(file);
            freader.freader.onload = function (e) {
                $("#aimage").attr("src", e.target.result); //显示图片
            }
        }
    }

    function ChooseImage() {
        $("#imagechoose").click();
    }
</script>
</body>
</html>