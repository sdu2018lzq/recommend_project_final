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

    <title>关于我们</title>

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

        ul.nav-tabs li.active a,
        ul.nav-tabs li.active a:hover {
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
            top: 30px;
            /* Set the top position of pinned element */
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

            <!--            <form class="form-inline d-none d-sm-inline-block">-->
            <!--                <div class="input-group input-group-navbar">-->
            <!--                    <input type="text" class="form-control" placeholder="Search…" aria-label="Search">-->
            <!--                    <div class="input-group-append">-->
            <!--                        <button class="btn" type="button">-->
            <!--                            <i class="align-middle" data-feather="search"></i>-->
            <!--                        </button>-->
            <!--                    </div>-->
            <!--                </div>-->
            <!--            </form>-->
            <a href="#"><img src="/directory2/img/xiaofei.png" alt="" /></a>

            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align">
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#"
                           data-toggle="dropdown">
                            <i class="align-middle" data-feather="settings"></i>
                        </a>

                        <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#"
                           data-toggle="dropdown">
                            <img src="/directory2/img/avatars/avatar.jpg" class="avatar img-fluid rounded mr-1"
                                 alt="Charles Hall" />
                            <span class="text-dark">Hi~ ${sessionScope.user.name} ${sessionScope.user.phone}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="/toProfile"><i class="align-middle mr-1"
                                                                                  data-feather="user"></i> 我的简历</a>
                            <a class="dropdown-item" href="#"><i class="align-middle mr-1" data-feather="home"></i>
                                回到主页</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/toAboutUs"><i class="align-middle mr-1"
                                                                 data-feather="help-circle"></i> 帮助</a>
                            <a class="dropdown-item" href="#"><i class="align-middle mr-1"
                                                                 data-feather="log-out"></i> 退出登录</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="content">

            <body>
            <script src="/xiaoxizn-static/js/19.867ed66e.chunk.js" type="text/javascript" async=""
                    charset="utf-8"></script>
            <link href="https://jspassport.ssl.qhimg.com" rel="preconnect">
            <link href="https://s.ssl.qhres.com" rel="preconnect">
            <link href="https://zz.bdstatic.com" rel="preconnect">
            <link href="http://s.360.cn" rel="preconnect">
            <style type="text/css">
                .about-page {
                    display: flex;
                    align-items: center;
                    flex-direction: column;
                    background-image: url(/xiaoxizn-static/media/background-2.c45d1447.png);
                    background-repeat: no-repeat;
                    background-size: 100%
                }

                .about-page .about-description-section {
                    padding-top: 76px;
                    padding-bottom: 0;
                    width: 70%;
                    max-width: 1000px
                }

                .about-page .about-mission-section {
                    display: flex;
                    align-items: center;
                    flex-direction: column;
                    padding-top: 100px;
                    padding-bottom: 200px;
                    width: 70%;
                    max-width: 1000px
                }

                .about-page .about-mission-section h4 {
                    font-size: 17px;
                    margin: 20px 0 60px;
                    color: #6772e5
                }

                .about-page .about-mission-section h5 {
                    font-size: 17px;
                    font-weight: 500;
                    color: #32325d
                }

                .about-page .about-mission-section p {
                    font-size: 15px;
                    letter-spacing: .6px;
                    color: #525f7f;
                    line-height: 20px;
                    margin-top: 0;
                    margin-bottom: 1em
                }

                .about-page .about-mission-section p a {
                    color: #6772e5;
                    font-weight: 500
                }
            </style>
            <meta content="简历解析,人岗匹配,简历评估,小析智能,小析,招聘AI,人才画像" data-react-helmet="true" name="keywords">
            <meta content="小析智能，提供简历解析、人岗匹配、候选人画像等服务，致力于通过AI技术提高招聘速度，降低时间成本，节省招聘支出。" data-react-helmet="true"
                  name="description">
            <meta content="https://www.xiaoxizn.com/about/" data-react-helmet="true" property="og:url">
            <meta content="关于我们 - 小析智能" data-react-helmet="true" property="og:title">
            <meta content="小析智能，提供简历解析、人岗匹配、候选人画像等服务，致力于通过AI技术提高招聘速度，降低时间成本，节省招聘支出。" data-react-helmet="true"
                  property="og:description">
            <meta content="小析智能" data-react-helmet="true" property="og:site_name">
            <meta content="https://img.xiaoxizn.com/landing/home.png" data-react-helmet="true"
                  property="og:image">
            <meta content="关于我们 - 小析智能" data-react-helmet="true" name="twitter:title">
            <meta content="小析智能，提供简历解析、人岗匹配、候选人画像等服务，致力于通过AI技术提高招聘速度，降低时间成本，节省招聘支出。" data-react-helmet="true"
                  name="twitter:description">
            <meta content="summary" data-react-helmet="true" name="twitter:card">
            <meta content="小析智能" data-react-helmet="true" name="twitter:site">
            <meta content="小析智能" data-react-helmet="true" name="twitter:creator">
            <meta content="https://img.xiaoxizn.com/landing/home.png" data-react-helmet="true"
                  name="twitter:image">
            <link href="https://hm.baidu.com" rel="preconnect">
            <link href="https://sp0.baidu.com" rel="preconnect">
            <style type="text/css">
                @font-face {
                    font-family: Chinese Quote;
                    src: local("PingFang SC"), local("SimSun");
                    unicode-range: u+2018, u+2019, u+201c, u+201d
                }

                body,
                html {
                    width: 100%;
                    height: 100%
                }

                * {
                    box-sizing: border-box
                }

                html {
                    font-family: sans-serif;
                    line-height: 1.15;
                    -webkit-text-size-adjust: 100%;
                    -ms-text-size-adjust: 100%;
                    -ms-overflow-style: scrollbar;
                    -webkit-tap-highlight-color: transparent
                }

                @-ms-viewport {
                    width: device-width
                }

                body,
                footer {
                    font-size: 14px
                }

                footer {
                    display: block;
                    clear: both;
                    background: #fff;
                    position: relative;
                    z-index: 100;
                    color: #314659;
                    box-shadow: 0 1000px 0 1000px #fff
                }

                body {
                    margin: 0;
                    font-family: Chinese Quote, -apple-system, BlinkMacSystemFont, Segoe UI, PingFang SC, Hiragino Sans GB, Microsoft YaHei, Helvetica Neue, Helvetica, Arial, sans-serif;
                    font-variant: tabular-nums;
                    line-height: 1.5;
                    color: rgba(0, 0, 0, .65);
                    background-color: #fff
                }

                h1,
                h2,
                h4,
                p {
                    margin-top: 0
                }

                h1,
                h2,
                h4 {
                    color: rgba(0, 0, 0, .85);
                    font-weight: 500;
                    margin-bottom: .5em
                }

                p {
                    margin-bottom: 1em
                }

                a {
                    color: #1890ff;
                    background-color: transparent;
                    text-decoration: none;
                    outline: 0;
                    cursor: pointer;
                    transition: color .3s;
                    -webkit-text-decoration-skip: objects;
                    touch-action: manipulation
                }

                a:focus {
                    text-decoration: underline;
                    text-decoration-skip: ink
                }

                a:hover {
                    color: #40a9ff
                }

                a:active {
                    color: #096dd9
                }

                a:active,
                a:hover {
                    outline: 0;
                    text-decoration: none
                }

                #logo img,
                img {
                    vertical-align: middle
                }

                img {
                    border-style: none
                }

                .ant-row {
                    position: relative;
                    margin-left: 0;
                    margin-right: 0;
                    height: auto;
                    zoom: 1;
                    display: block;
                    box-sizing: border-box
                }

                .ant-row:after,
                .ant-row:before {
                    content: "";
                    display: table
                }

                .ant-row:after {
                    clear: both
                }

                .ant-col-lg-16,
                .ant-col-lg-24,
                .ant-col-lg-6,
                .ant-col-lg-8,
                .ant-col-md-18,
                .ant-col-md-6,
                .ant-col-sm-24,
                .ant-col-xs-24 {
                    position: relative;
                    min-height: 1px;
                    padding-left: 0;
                    padding-right: 0
                }

                .ant-col-xs-24 {
                    float: left;
                    flex: 0 0 auto;
                    display: block;
                    box-sizing: border-box;
                    width: 100%
                }

                .ant-col-xs-0 {
                    display: none
                }

                @media (min-width:576px) {
                    .ant-col-sm-24 {
                        float: left;
                        flex: 0 0 auto;
                        display: block;
                        box-sizing: border-box;
                        width: 100%
                    }

                    .ant-col-sm-0 {
                        display: none
                    }
                }

                @media (min-width:768px) {

                    .ant-col-md-18,
                    .ant-col-md-6 {
                        float: left;
                        flex: 0 0 auto;
                        display: block;
                        box-sizing: border-box;
                        width: 75%
                    }

                    .ant-col-md-6 {
                        width: 25%
                    }
                }

                @media (min-width:992px) {

                    .ant-col-lg-16,
                    .ant-col-lg-24,
                    .ant-col-lg-6,
                    .ant-col-lg-8 {
                        float: left;
                        flex: 0 0 auto
                    }

                    .ant-col-lg-24 {
                        display: block;
                        box-sizing: border-box;
                        width: 100%
                    }

                    .ant-col-lg-16,
                    .ant-col-lg-6,
                    .ant-col-lg-8 {
                        display: block;
                        box-sizing: border-box;
                        width: 66.66666667%
                    }

                    .ant-col-lg-6,
                    .ant-col-lg-8 {
                        width: 33.33333333%
                    }

                    .ant-col-lg-6 {
                        width: 25%
                    }
                }

                @media (min-width:1200px) {

                    .ant-col-xl-19,
                    .ant-col-xl-5 {
                        float: left;
                        flex: 0 0 auto;
                        display: block;
                        box-sizing: border-box;
                        width: 79.16666667%
                    }

                    .ant-col-xl-5 {
                        width: 20.83333333%
                    }
                }

                @media (min-width:1600px) {

                    .ant-col-xxl-20,
                    .ant-col-xxl-4 {
                        float: left;
                        flex: 0 0 auto;
                        display: block;
                        box-sizing: border-box;
                        width: 83.33333333%
                    }

                    .ant-col-xxl-4 {
                        width: 16.66666667%
                    }
                }

                #header {
                    background-color: #fff;
                    position: fixed;
                    width: 100%;
                    z-index: 10;
                    height: 64px;
                    box-shadow: 0 1px 0 0 rgba(0, 0, 0, .08)
                }

                #logo,
                #menu {
                    overflow: hidden;
                    height: 64px
                }

                #logo {
                    padding-left: 40px;
                    line-height: 64px;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    cursor: pointer;
                    float: left
                }

                #logo img {
                    display: inline;
                    margin-right: 8px;
                    width: 32px
                }

                #logo span {
                    outline: 0;
                    font-size: 22px;
                    line-height: 32px;
                    color: #2847c3;
                    font-weight: 600;
                    letter-spacing: .6px;
                    text-align: center
                }

                .header-meta {
                    zoom: 1;
                    padding-right: 40px
                }

                .header-meta:after,
                .header-meta:before {
                    content: "";
                    display: table
                }

                .header-meta:after {
                    clear: both
                }

                #menu {
                    float: right
                }

                #menu .dropdown-menu {
                    transition: color .1s cubic-bezier(.645, .045, .355, 1), border-color .1s cubic-bezier(.645, .045, .355, 1), background .1s cubic-bezier(.645, .045, .355, 1), padding .15s cubic-bezier(.645, .045, .355, 1);
                    border-top: 2px solid transparent;
                    line-height: 60px;
                    top: 1px;
                    float: left;
                    border-bottom: 2px solid transparent;
                    cursor: pointer;
                    margin: -1px 0 0;
                    padding: 0 20px;
                    position: relative;
                    display: block;
                    white-space: nowrap;
                    font-size: 16px
                }

                #menu .dropdown-menu a {
                    color: #6b7c93
                }

                #menu .dropdown-menu:active,
                #menu .dropdown-menu:hover {
                    border-bottom: 2px solid #6772e5;
                    border-top: 2px solid transparent
                }

                #menu .dropdown-menu:active a,
                #menu .dropdown-menu:hover a {
                    color: #6772e5
                }

                #preview {
                    padding-top: 12px;
                    float: right;
                    margin-left: 28px
                }

                @media only screen and (min-width:1440px) and (max-width:1599px) {
                    #header .ant-row .ant-col-xl-5 {
                        width: 274px
                    }
                }

                @media only screen and (max-width:768px) {
                    #logo {
                        padding: 0 26px
                    }

                    .header-meta {
                        padding-right: 80px
                    }
                }

                footer.dark {
                    background-color: #000;
                    color: rgba(255, 255, 255, .65)
                }

                footer .ant-row .footer-center .contact-info span a:hover,
                footer.dark a,
                footer.dark h2 {
                    color: #fff
                }

                footer.dark a:focus,
                footer.dark a:hover {
                    color: #7795f8
                }

                footer.dark .bottom-bar {
                    border-top: 1px solid rgba(255, 255, 255, .25);
                    overflow: hidden
                }

                .markdown-div h1,
                footer .ant-row {
                    text-align: center
                }

                footer .ant-row .footer-center {
                    display: inline-block;
                    text-align: left
                }

                footer .ant-row .footer-center>h2 {
                    font-size: 16px;
                    font-weight: 500
                }

                footer .ant-row .footer-center>div {
                    margin: 12px 0
                }

                footer .ant-row .footer-center .logo-div,
                footer .ant-row .footer-center>h2 {
                    margin: 0 auto 24px;
                    position: relative
                }

                footer .ant-row .footer-center .logo-div .logo-text {
                    font-size: 16px;
                    font-weight: 500;
                    position: relative;
                    margin: 0 auto 24px 8px
                }

                footer .ant-row .footer-center .contact-info span a,
                footer .bottom-bar a {
                    color: rgba(255, 255, 255, .65)
                }

                footer .ant-row .footer-center .wechat {
                    margin: 20px 0 0;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    width: 220px
                }

                .common-button,
                footer .ant-row .footer-center .wechat .single-wechat {
                    border-radius: 4px
                }

                footer .ant-row .footer-center .wechat .single-wechat img {
                    width: 100px;
                    height: 100px;
                    border-radius: 4px
                }

                footer .ant-row .footer-center .wechat .single-wechat-text {
                    font-size: 10px;
                    margin-top: 4px;
                    text-align: center
                }

                footer .footer-wrap {
                    position: relative;
                    padding: 86px 114px 70px
                }

                footer .bottom-bar {
                    border-top: 1px solid #e5e7eb;
                    text-align: right;
                    padding: 20px 114px;
                    margin: 0;
                    line-height: 24px
                }

                footer .bottom-bar a:hover {
                    color: #fff
                }

                @media only screen and (max-width:992px) {
                    #footer .footer-wrap {
                        padding: 40px
                    }

                    #footer,
                    #footer .footer-center {
                        text-align: center
                    }

                    #footer h2 {
                        margin-top: 16px
                    }

                    #footer .bottom-bar {
                        text-align: center;
                        padding: 40px
                    }
                }

                .markdown-div h1 {
                    font-size: 40px;
                    line-height: 50px;
                    letter-spacing: 1.4px;
                    margin: 0 0 20px;
                    font-weight: 500;
                    color: #32325d
                }

                .markdown-div p {
                    line-height: 20px;
                    margin-top: 0;
                    margin-bottom: 1em;
                    font-size: 15px;
                    letter-spacing: .6px;
                    color: #525f7f
                }

                .common-button {
                    white-space: nowrap;
                    display: inline-block;
                    height: 40px;
                    line-height: 40px;
                    padding: 0 20px;
                    -webkit-box-shadow: 0 4px 6px rgba(50, 50, 93, .11), 0 1px 3px rgba(0, 0, 0, .08);
                    box-shadow: 0 4px 6px rgba(50, 50, 93, .11), 0 1px 3px rgba(0, 0, 0, .08);
                    background: #fff;
                    font-size: 15px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: .025em;
                    text-decoration: none;
                    -webkit-transition: all .15s ease;
                    transition: all .15s ease;
                    color: #fff;
                    background: #6772e5
                }

                .common-button:focus,
                .common-button:hover {
                    -webkit-transform: translateY(-1px);
                    transform: translateY(-1px);
                    -webkit-box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(0, 0, 0, .08);
                    box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(0, 0, 0, .08);
                    color: #fff;
                    background-color: #7795f8
                }

                .common-button:active {
                    -webkit-transform: translateY(1px);
                    transform: translateY(1px);
                    -webkit-box-shadow: 0 4px 6px rgba(50, 50, 93, .11), 0 1px 3px rgba(0, 0, 0, .08);
                    box-shadow: 0 4px 6px rgba(50, 50, 93, .11), 0 1px 3px rgba(0, 0, 0, .08);
                    color: #e6ebf1;
                    background-color: #555abf
                }

                .common-button-dark {
                    color: #fff;
                    background: #32325d
                }

                .common-button-dark:focus,
                .common-button-dark:hover {
                    color: #fff;
                    background-color: #43458b
                }

                .common-button-dark:active {
                    color: #e6ebf1;
                    background-color: #32325d
                }

                .header-empty-section {
                    height: 64px
                }
            </style>
            <div id="root">
                <div style="height:100%">
                    <div>

                        <div class="header-empty-section"></div>
                        <div style="height: 100%;">
                            <div class="about-page">
                                <div class="about-description-section">
                                    <div class="markdown-div">
                                        <div>
                                            <h1>关于我们</h1>
                                            <p>&nbsp;</p>
                                            <p>小飞智能云服务平台是SDU四位同学一起合作完成的。小飞智能云服务平台提供先进的简历解析和岗位挖掘技术解决方案，致力于人力资源行业智能化这一进程。通过技术提升求职效率，节省求职支出，节省时间成本。</p>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="about-mission-section">
                                    <div><img src="/directory2/img/page8/mission.svg"
                                              height="50px"></div>
                                    <h4>我们的使命</h4>
                                    <p>小飞智能的使命是用AI造福求职者。在就业市场越发激烈的今天，几乎每一个求职者都在被关于求职的各种问题困扰。所以我们创立了小飞智能，以AI机器学习技术为核心竞争力，帮助求职者真正实现智能应聘。我们的眼界注定了我们能够得到更先进的技术，提供更优质的服务。
                                    </p>
                                    <p>我们的服务囊括 简历分析，岗位搜索，行业分析，岗位推荐，
                                        简历解析，职位解析
                                        等。我们致力于不断创新，将人与AI相结合，提高求职效率；将这些改进传递给我们的客户，并为不断增长的AI应用未来提供动力。</p><br><br>
                                    <p>查看我们的 <a href="https://gitee.com/team-amazing/project-training">博客</a>，了解我们如何在求职领域运用AI。</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            </body>

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