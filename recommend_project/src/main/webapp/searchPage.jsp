<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: sdu2018lzq
  Date: 2021/6/3
  Time: 21:25
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

    <link rel="shortcut icon" href="/directory2/img/icons/icon-48x48.png"/>

    <title>岗位搜索</title>

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

                <li class="sidebar-item active">
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
            <div class="row" style="height: 80px">
                <!--                <form class="form-inline d-none d-sm-inline-block">-->
                <!--                    <div class="input-group input-group-navbar">-->
                <!--                        <input type="text" class="form-control" placeholder="Search…" aria-label="Search"-->
                <!--                               style="background-color: white">-->
                <!--                        <div class="input-group-append">-->
                <!--                            <button class="btn" type="button">-->
                <!--                                <i class="align-middle" data-feather="search"></i>-->
                <!--                            </button>-->
                <!--                        </div>-->
                <!--                    </div>-->
                <!--                </form>-->
                <div style="display: inline">
                    <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                        <span class="text-dark">选择城市</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left">
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity全部"> 全部</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity北京"> 北京</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity上海"> 上海</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity广州"> 广州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity深圳"> 深圳</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity南京"> 南京</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity杭州"> 杭州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity苏州"> 苏州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity宁波"> 宁波</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity青岛"> 青岛</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity济南"> 济南</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity福州"> 福州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity厦门"> 厦门</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity成都"> 成都</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity重庆"> 重庆</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity天津"> 天津</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity西安"> 西安</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity武汉"> 武汉</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity长沙"> 长沙</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity郑州"> 郑州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity合肥"> 合肥</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity昆明"> 昆明</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity东莞"> 东莞</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity大连"> 大连</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity沈阳"> 沈阳</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity长春"> 长春</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectCity哈尔滨"> 哈尔滨</a>
                    </div>
                </div>

                <div style="display: inline">
                    <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                        <span class="text-dark">选择行业</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left">
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry全部"> 全部</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry计算机"> 计算机</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry互联网"> 互联网</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry通信"> 通信</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry电子"> 电子</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry销售"> 销售</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry客服"> 客服</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry会计"> 会计</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry金融"> 金融</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry银行"> 银行</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry保险"> 保险</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry生产"> 生产</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry机械"> 机械</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry汽车"> 汽车</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry运营"> 运营</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry采购"> 采购</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry物流"> 物流</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry服装"> 服装</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry建筑"> 建筑</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry房地产"> 房地产</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry设计"> 设计</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry市场"> 市场</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry媒体"> 媒体</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry广告"> 广告</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry人事"> 人事</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry行政"> 行政</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry教育"> 教育</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry培训"> 培训</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry生物"> 生物</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry制药"> 制药</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry化工"> 化工</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry医疗"> 医疗</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry顾问"> 顾问</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry法律"> 法律</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry交通"> 交通</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/selectIndustry翻译"> 翻译</a>
                    </div>
                </div>

                <div style="display: inline">
                    <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                        <span class="text-dark">最低薪资</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left">
                        <a class="dropdown-item" href="/selectMinSalary全部"> 全部</a>
                        <a class="dropdown-item" href="/selectMinSalary30000">
                            30000</a>
                        <a class="dropdown-item" href="/selectMinSalary60000">
                            60000</a>
                        <a class="dropdown-item" href="/selectMinSalary100000">
                            100000</a>
                        <a class="dropdown-item" href="/selectMinSalary150000">
                            150000</a>
                        <a class="dropdown-item" href="/selectMinSalary200000">
                            200000</a>
                    </div>
                </div>
                <div style="display: inline">
                    <a class="nav-link d-none d-sm-inline-block">
                        <span class="text-dark">我的筛选条件：${sessionScope.cityName} ${sessionScope.industry} ${sessionScope.minSalary}</span>
                    </a>
                </div>
            </div>
            <div class="row">


                <c:if test="${(sessionScope.jdList.size()-1)>=0}">

                    <c:forEach var="i" begin="${sessionScope.id*10-10}"
                               end="${(sessionScope.jdList.size()-sessionScope.id*10)<0?(sessionScope.jdList.size()-1):(sessionScope.id*10-1)}"
                               varStatus="no">

                        <div class="col-12 col-lg-6" style="display: inline">

                            <div class="card">
                                <div class="card-header">
                                    <ul class="nav nav-pills card-header-pills pull-right" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab"
                                               href="#tab-${no.count*3}">公司信息</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tab-${no.count*3+1}">岗位信息</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tab-${no.count*3+2}">岗位描述</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="tab-${no.count*3}" role="tabpanel">

                                            <h1 class="card-title">${sessionScope.jdList.get(i).getPositionName()}</h1>
                                            <p class="card-text">${sessionScope.jdList.get(i).getCompanyName()}</p>
                                            <a href="/toDetailsPage${sessionScope.jdList.get(i).getPositionId()}"
                                               class="btn btn-primary">查看详情</a>
                                        </div>
                                        <div class="tab-pane fade" id="tab-${no.count*3+1}" role="tabpanel">
                                            <div class="admin-task-bd">

                                                <p>工作城市：${sessionScope.jdList.get(i).getAddress()}</p>

                                                <p>公司性质：${sessionScope.jdList.get(i).getCompanyInfo()}</p>

                                                <p>招聘名额：<c:if test="${sessionScope.jdList.get(i).getHeadCount()<0}">
                                                    若干人
                                                </c:if>
                                                    <c:if test="${sessionScope.jdList.get(i).getHeadCount()>0}">
                                                        ${sessionScope.jdList.get(i).getHeadCount()}
                                                    </c:if>
                                                </p>

                                                <p>薪资：${sessionScope.jdList.get(i).getSalary()}</p>

                                            </div>
                                            <a href="/toDetailsPage${sessionScope.jdList.get(i).getPositionId()}"
                                               class="btn btn-primary">查看详情</a>
                                        </div>
                                        <div class="tab-pane fade" id="tab-${no.count*3+2}" role="tabpanel">

                                            <p class="card-text">${sessionScope.jdList.get(i).getJobDescription()}</p>
                                            <a href="/toDetailsPage${sessionScope.jdList.get(i).getPositionId()}"
                                               class="btn btn-primary">查看详情</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

            </div>


            <c:if test="${(sessionScope.jdList.size()-1)>=0}">
                <div class="card">
                    <div class="card-body">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination pagination-lg">
                                <c:if test="${(sessionScope.id-1)>0}">
                                    <li class="page-item"><a class="page-link" href="/toSearchPage${sessionScope.id-1}"><i
                                            class="fas fa-angle-left"></i></a></li>
                                </c:if>

                                <c:if test="${sessionScope.len<=7}">
                                    <c:forEach var="page" begin="0" end="${sessionScope.len-1}">
                                        <c:if test="${(page+1)==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage${page+1}">${page+1}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(page+1)!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="/toSearchPage${page+1}">${page+1}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${sessionScope.len>7}">
                                    <c:if test="${(sessionScope.id-4)<1}">
                                        <c:if test="${1==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage1">1</a></li>
                                        </c:if>
                                        <c:if test="${1!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link" href="/toSearchPage1">1</a></li>
                                        </c:if>
                                        <c:if test="${2==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage2">2</a></li>
                                        </c:if>
                                        <c:if test="${2!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link" href="/toSearchPage2">2</a></li>
                                        </c:if>
                                        <c:if test="${3==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage3">3</a></li>
                                        </c:if>
                                        <c:if test="${3!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link" href="/toSearchPage3">3</a></li>
                                        </c:if>
                                        <c:if test="${4==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage4">4</a></li>
                                        </c:if>
                                        <c:if test="${4!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link" href="/toSearchPage4">4</a></li>
                                        </c:if>
                                        <c:if test="${5==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage5">5</a></li>
                                        </c:if>
                                        <c:if test="${5!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link" href="/toSearchPage5">5</a></li>
                                        </c:if>

                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <li class="page-item"><a class="page-link"
                                                                 href="/toSearchPage${sessionScope.len}">${sessionScope.len}</a>
                                        </li>
                                    </c:if>

                                    <c:if test="${(sessionScope.id+4)>(sessionScope.jdList.size()%10!=0?(sessionScope.jdList.size()/10+1):sessionScope.jdList.size()/10)}">
                                        <li class="page-item"><a class="page-link" href="/toSearchPage1">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <c:if test="${(sessionScope.len-4)==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage${sessionScope.len-4}">${sessionScope.len-4}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len-4)!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="/toSearchPage${sessionScope.len-4}">${sessionScope.len-4}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len-3)==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage${sessionScope.len-3}">${sessionScope.len-3}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len-3)!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="/toSearchPage${sessionScope.len-3}">${sessionScope.len-3}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len-2)==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage${sessionScope.len-2}">${sessionScope.len-2}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len-2)!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="/toSearchPage${sessionScope.len-2}">${sessionScope.len-2}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len-1)==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage${sessionScope.len-1}">${sessionScope.len-1}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len-1)!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="/toSearchPage${sessionScope.len-1}">${sessionScope.len-1}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len)==sessionScope.id}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="/toSearchPage${sessionScope.len}">${sessionScope.len}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${(sessionScope.len)!=sessionScope.id}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="/toSearchPage${sessionScope.len}">${sessionScope.len}</a>
                                            </li>
                                        </c:if>
                                    </c:if>

                                    <c:if test="${(sessionScope.id+4)<=(sessionScope.jdList.size()%10!=0?(sessionScope.jdList.size()/10+1):sessionScope.jdList.size()/10)&&sessionScope.id-4>=1}">
                                        <li class="page-item"><a class="page-link" href="/toSearchPage1">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">...</a></li>

                                        <li class="page-item"><a class="page-link"
                                                                 href="/toSearchPage${sessionScope.id-1}">${sessionScope.id-1}</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link"
                                                                        href="/toSearchPage${sessionScope.id}">${sessionScope.id}</a>
                                        </li>
                                        <li class="page-item"><a class="page-link"
                                                                 href="/toSearchPage${sessionScope.id+1}">${sessionScope.id+1}</a>
                                        </li>

                                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                                        <li class="page-item"><a class="page-link"
                                                                 href="/toSearchPage${sessionScope.len}">${sessionScope.len}</a>
                                        </li>
                                    </c:if>
                                </c:if>


                                <c:if test="${(sessionScope.id)<(sessionScope.jdList.size()%10!=0?(sessionScope.jdList.size()/10+1):sessionScope.jdList.size()/10)}">
                                    <li class="page-item"><a class="page-link" href="/toSearchPage${sessionScope.id+1}"><i
                                            class="fas fa-angle-right"></i></a></li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </c:if>
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
