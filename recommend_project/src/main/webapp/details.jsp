<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sdu2018lzq
  Date: 2021/6/3
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
    <meta name="author" content="AdminKit">
    <meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">

    <link rel="shortcut icon" href="/directory2/img/icons/icon-48x48.png" />

    <title>岗位详情</title>

    <link href="/directory2/css/app.css" rel="stylesheet">
    <!--    <link href="/directory2/css/amazeui.min.css" rel="stylesheet">-->
    <!--    <link href="/directory2/css/admin.css" rel="stylesheet">-->

    <style>
        /* Custom Styles */
        ul.nav-tabs{
            width: 140px;
            margin-top: 20px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
        }
        ul.nav-tabs li{
            margin: 0;
            border-top: 1px solid #ddd;
        }
        ul.nav-tabs li:first-child{
            border-top: none;
        }
        ul.nav-tabs li a{
            margin: 0;
            padding: 8px 16px;
            border-radius: 0;
        }
        ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
            color: #fff;
            background: #0088cc;
            border: 1px solid #0088cc;
        }
        ul.nav-tabs li:first-child a{
            border-radius: 4px 4px 0 0;
        }
        ul.nav-tabs li:last-child a{
            border-radius: 0 0 4px 4px;
        }
        ul.nav-tabs.affix{
            top: 30px; /* Set the top position of pinned element */
        }
        /* .card-body m-sm-3 m-md-5{
            width: 1300px;
            float:left;
        } */


        #bodyleft{
            width: 500px;
            float: left;

        }


        .col-md-6 {
            flex: 0 0 80%;
            max-width: 80%;
        }
        #companybox{
            border:3px solid #000;
            margin:20px;
        }
        #buttongo{
            padding: 0%;
            margin: 0%;
        }

        .row mb-4{
            width: 800px;
        }
        .card-body m-sm-3 m-md-5{
            padding-bottom: 0px;
        }
        #body{
            width: 1300px;
            display:inline;
            margin-top:4px;
            margin-left: 4px;
            padding-bottom: 0px;
            margin-bottom: 0px !important;


        }
        #bodyright{
            /* text-align: center; */
            width: 500px;
            float: left;
            padding: 0px;
            margin: 0px !important;
            padding-bottom: 0px;
            margin-bottom: 0px;
        }
        #bodytxt{
            width: 100%;
            padding-left: 30px !important;
            margin-left: 48px;

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
                        <img src="/directory2/img/avatars/avatar.jpg" alt="" class="img-fluid rounded-circle mb-2" width="128" height="128" />
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
            <a href="#"><img src="/directory2/img/xiaofei.png" alt="" /></a>

            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align">
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                            <i class="align-middle" data-feather="settings"></i>
                        </a>

                        <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                            <img src="/directory2/img/avatars/avatar.jpg" class="avatar img-fluid rounded mr-1" alt="Charles Hall"/>
                            <span class="text-dark">Hi~ ${sessionScope.user.name} ${sessionScope.user.phone}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="/toProfile"><i class="align-middle mr-1"
                                                                                                            data-feather="user"></i> 我的简历</a>
                            <a class="dropdown-item" href="/login1"><i class="align-middle mr-1" data-feather="home"></i> 回到主页</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/toAboutUs"><i class="align-middle mr-1"
                                                                 data-feather="help-circle"></i> 帮助</a>
                            <a class="dropdown-item" href="/toLogin"><i class="align-middle mr-1" data-feather="log-out"></i> 退出登录</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="content">

            <div class="container-fluid p-0">

                <h1 class="h3 mb-3">岗位详情</h1>

                <div class="row">
                    <div class="col-12">
                        <div class="card" id="card-body">

                            <div class="card-body m-sm-3 m-md-5" id="body" style="font-size:25px">
                                <div class="mb-4" id="bodyleft">
                                    <strong>公司名：</strong>
                                    <p></p>
                                    <p>${sessionScope.jd.getCompanyName()}</p>

                                    <br/>
                                    <strong>岗位名：</strong>
                                    <br/>${sessionScope.jd.getPositionName()}
                                </div>
                                <div id="bodyright" class="card-body m-sm-3 m-md-5">
                                    <div class="text-center" id="buttongo">
                                        <!--                                    <p class="text-sm">-->
                                        <!--                                        <strong>投递入口：</strong>-->
                                        <!--                                        https://msearch.51job.com/jobs/hangzhou/131327734.html?rc=03-->
                                        <!--                                    </p>-->
                                        <a href="${sessionScope.jd.getUrl()}" class="btn btn-primary" style="font-size:20px">
                                            前往投递
                                        </a>
                                        <c:if test="${sessionScope.isCollection == true}">
                                            <a href="/cancelCollection${sessionScope.jd.getPositionId()}" class="btn btn-primary" style="font-size:20px">
                                                <i class="align-middle mr-1" data-feather="star"></i>取消收藏
                                            </a>
                                        </c:if>
                                        <c:if test="${sessionScope.isCollection == false}">
                                            <a href="/addToCollection${sessionScope.jd.getPositionId()}" class="btn btn-primary" style="font-size:20px">
                                                <i class="align-middle mr-1" data-feather="star"></i>加入收藏
                                            </a>
                                        </c:if>
                                    </div>
                                    <p></p>
                                    <div class="row mb-4">
                                        <div class="col-md-6" id="companybox" style="font-size:15px">
                                            <p></p>

                                            工作城市：${sessionScope.jd.getAddress()}
                                            <br/>
                                            公司性质：${sessionScope.jd.getCompanyInfo()}
                                            <br/>
                                            招聘名额：<c:if test="${sessionScope.jd.getHeadCount()<0}">
                                            若干人
                                        </c:if>
                                            <c:if test="${sessionScope.jd.getHeadCount()>0}">
                                                ${sessionScope.jd.getHeadCount()}
                                            </c:if>
                                            <br/>
                                            薪资：${sessionScope.jd.getSalary()}

                                            <p></p>
                                        </div>
                                    </div>


                                </div>
                            </div>







                            <div class="row mb-4">
                                <div class="col-md-6" id="bodytxt" style="font-size:20px">
                                    <strong style="font-size:25px">岗位介绍：</strong>
                                    <br>
                                    <br>
                                    ${sessionScope.jd.getJobDescription()}
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
                                <a class="text-muted" href="#">帮助</a>
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

</body>

</html>