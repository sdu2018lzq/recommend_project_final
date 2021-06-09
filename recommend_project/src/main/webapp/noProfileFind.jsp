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

    <title>岗位推荐</title>

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
                        </div>`
                    </li>
                </ul>
            </div>
        </nav>

        <main class="content" style="background-image: url(./directory2/img/page8/email-pattern.png);">

            <body>
            <link href="https://jspassport.ssl.qhimg.com" rel="preconnect">
            <link href="https://zz.bdstatic.com" rel="preconnect">
            <link href="https://s.ssl.qhres.com" rel="preconnect">
            <script src="/xiaoxizn-static/js/3.b2303953.chunk.js" type="text/javascript" async=""
                    charset="utf-8"></script>
            <link href="https://hm.baidu.com" rel="preconnect">
            <style type="text/css">
                .safety {
                    height: 100%;
                    margin-bottom: 100px;
                    display: flex;
                    flex-direction: column;
                    align-items: center
                }

                .safety .safety-title {
                    margin-bottom: 48px
                }

                .safety .safety-title h2 {
                    font-size: 40px;
                    line-height: 50px;
                    color: #fff;
                    text-align: center
                }

                .safety .safety-table {
                    height: 100%;
                    width: 70%;
                    max-width: 1200px;
                    border-radius: 8px;
                    text-align: center;
                    background-color: #2d2d54;
                    display: flex;
                    flex-direction: row;
                    flex-wrap: wrap;
                    padding: 5px
                }

                .safety .safety-table .safety-table-single {
                    width: 25%;
                    padding: 5px
                }

                .safety .safety-table .safety-table-single .safety-table-single-header {
                    padding: 0 40px;
                    height: 70px;
                    border-radius: 4px;
                    align-items: center;
                    justify-content: center;
                    display: flex
                }

                .safety .safety-table .safety-table-single .safety-table-single-header h4 {
                    font-size: 17px;
                    font-weight: 400;
                    color: #fff;
                    margin-bottom: 0
                }

                .safety .safety-table .safety-table-single .safety-table-single-body {
                    min-height: 120px;
                    border-radius: 4px;
                    color: #fff;
                    background-color: #3a3c66;
                    padding: 16px;
                    font-size: 14px;
                    font-weight: 400
                }

                .safety .safety-table .safety-table-single .first {
                    background-color: #43458b
                }

                .safety .safety-table .safety-table-single .second {
                    background-color: #555abf
                }

                .safety .safety-table .safety-table-single .third {
                    background-color: #6772e5
                }

                .safety .safety-table .safety-table-single .fourth {
                    background-color: #7795f8
                }

                @media only screen and (max-width:1400px) {
                    .safety .safety-table .safety-table-single .safety-table-single-header {
                        padding: 0 20px
                    }

                    .safety .safety-table .safety-table-single .safety-table-single-header h4 {
                        font-size: 15px
                    }

                    .safety .safety-table .safety-table-single .safety-table-single-body {
                        font-size: 13px
                    }
                }

                @media only screen and (max-width:1100px) {
                    .safety .safety-table .safety-table-single {
                        width: 50%
                    }

                    .safety .safety-table .safety-table-single .safety-table-single-header {
                        padding: 0 40px
                    }

                    .safety .safety-table .safety-table-single .safety-table-single-header h4 {
                        font-size: 16px
                    }

                    .safety .safety-table .safety-table-single .safety-table-single-body {
                        font-size: 14px
                    }
                }

                @media only screen and (max-width:768px) {
                    .safety .safety-title h2 {
                        font-size: 26px;
                        line-height: 36px
                    }
                }

                @media only screen and (max-width:576px) {
                    .safety .safety-table .safety-table-single {
                        width: 100%
                    }

                    .safety .safety-table .safety-table-single .safety-table-single-header {
                        padding: 0 40px
                    }

                    .safety .safety-table .safety-table-single .safety-table-single-header h4 {
                        font-size: 16px
                    }

                    .safety .safety-table .safety-table-single .safety-table-single-body {
                        font-size: 14px
                    }
                }
            </style>
            <style type="text/css">
                .apply-div {
                    flex-direction: column
                }

                .apply-div,
                .apply-div .apply-div-first {
                    height: 100%;
                    background-color: #fff;
                    display: flex;
                    align-items: center
                }

                .apply-div .apply-div-first {
                    width: 80%;
                    max-width: 1100px;
                    padding: 60px 5%;
                    justify-content: space-between
                }

                .apply-div .apply-div-first .apply-div-title h2 {
                    text-align: left;
                    font-weight: 300;
                    font-size: 32px;
                    color: #32325d;
                    letter-spacing: .6px;
                    margin-bottom: 0
                }

                .apply-div .apply-div-first .apply-div-title .main {
                    color: #6772e5
                }

                .apply-div .apply-div-second {
                    background-color: #fff;
                    display: flex;
                    flex-direction: row;
                    width: 80%;
                    max-width: 1100px;
                    margin-left: 10%;
                    margin-right: 10%;
                    margin-bottom: 100px
                }

                .apply-div .apply-div-second .apply-div-second-card {
                    width: 48%;
                    position: relative;
                    display: flex;
                    flex-direction: row;
                    justify-content: center;
                    align-items: center;
                    overflow: hidden;
                    padding: 40px;
                    background-color: #fff;
                    border-radius: 4px;
                    -webkit-box-shadow: 0 15px 35px rgba(50, 50, 93, .1), 0 5px 15px rgba(0, 0, 0, .07);
                    box-shadow: 0 15px 35px rgba(50, 50, 93, .1), 0 5px 15px rgba(0, 0, 0, .07);
                    -webkit-transition-property: color, background-color, -webkit-box-shadow, -webkit-transform;
                    transition-property: color, background-color, -webkit-box-shadow, -webkit-transform;
                    transition-property: color, background-color, box-shadow, transform;
                    transition-property: color, background-color, box-shadow, transform, -webkit-box-shadow, -webkit-transform;
                    -webkit-transition-duration: .15s;
                    transition-duration: .15s
                }

                .apply-div .apply-div-second .apply-div-second-card h4 {
                    font-size: 17px;
                    line-height: 26px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: .025em;
                    color: #24b47e
                }

                .apply-div .apply-div-second .apply-div-second-card p {
                    margin-bottom: 0;
                    font-weight: 400;
                    font-size: 17px;
                    line-height: 28px;
                    color: #525f7f
                }

                .apply-div .apply-div-second .apply-div-second-card .img {
                    padding-right: 40px
                }

                .apply-div .apply-div-second .apply-div-second-card .img .heading-icon {
                    width: 66px;
                    height: 66px
                }

                .apply-div .apply-div-second .apply-div-second-card:focus,
                .apply-div .apply-div-second .apply-div-second-card:hover {
                    -webkit-transform: translateY(-1px);
                    transform: translateY(-1px);
                    -webkit-box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(0, 0, 0, .08);
                    box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(0, 0, 0, .08)
                }

                .apply-div .apply-div-second .right {
                    margin-left: 2%
                }

                .apply-div .apply-div-second .left {
                    margin-right: 2%
                }

                .apply-div .apply-div-second .left:focus h4,
                .apply-div .apply-div-second .left:hover h4,
                .apply-div .apply-div-second .right:focus h4,
                .apply-div .apply-div-second .right:hover h4 {
                    color: #6ed69a
                }

                .ant-modal-content .ant-modal-title {
                    color: #32325d;
                    letter-spacing: .6px;
                    font-size: 20px
                }

                .ant-modal-content .ant-modal-body .modal-items {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    width: 100%
                }

                .ant-modal-content .ant-modal-body .modal-items .modal-product {
                    width: 33.3%;
                    margin: 5px;
                    height: 100px;
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    flex-direction: column;
                    justify-content: center
                }

                .ant-modal-content .ant-modal-body .modal-items .modal-product img {
                    margin: 8px 0
                }

                .ant-modal-content .ant-modal-body .modal-items .modal-product h4 {
                    color: #525f7f;
                    font-size: 17px;
                    font-weight: 400
                }

                .ant-modal-content .ant-modal-body .modal-items .modal-product:focus,
                .ant-modal-content .ant-modal-body .modal-items .modal-product:hover {
                    -webkit-transform: translateY(-1px);
                    transform: translateY(-1px);
                    -webkit-box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(0, 0, 0, .08);
                    box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(0, 0, 0, .08)
                }

                @media only screen and (max-width:992px) {
                    .apply-div .apply-div-second .apply-div-second-card {
                        flex-direction: column;
                        align-items: center;
                        text-align: center
                    }

                    .apply-div .apply-div-second .apply-div-second-card .img {
                        padding-right: 0
                    }

                    .apply-div .apply-div-second .apply-div-second-card h4 {
                        margin-top: 8px
                    }
                }

                @media only screen and (max-width:768px) {
                    .apply-div .apply-div-first {
                        flex-direction: column
                    }

                    .apply-div .apply-div-first .apply-div-title {
                        margin-bottom: 25px
                    }

                    .apply-div .apply-div-first .apply-div-title .main {
                        text-align: center
                    }

                    .apply-div .apply-div-second {
                        flex-direction: column;
                        align-items: center
                    }

                    .apply-div .apply-div-second .apply-div-second-card {
                        width: 70%
                    }

                    .apply-div .apply-div-second .right {
                        margin-left: 0
                    }

                    .apply-div .apply-div-second .left {
                        margin-right: 0;
                        margin-bottom: 25px
                    }
                }

                @media only screen and (max-width:576px) {
                    .apply-div .apply-div-first .apply-div-title h2 {
                        font-size: 26px
                    }

                    .apply-div .apply-div-second .apply-div-second-card {
                        width: 90%;
                        padding: 15px
                    }
                }
            </style>
            <style type="text/css">
                .xiaoxiBackground {
                    position: absolute;
                    left: 0;
                    top: 50%;
                    right: 0;
                    -webkit-transform: skewY(-12deg);
                    -ms-transform: skewY(-12deg);
                    transform: skewY(-12deg);
                    pointer-events: none
                }

                .xiaoxiBackground .xiaoxi {
                    position: absolute;
                    top: auto;
                    left: 0;
                    right: 0
                }

                .xiaoxiBackground .xiaoxi.pattern {
                    overflow: hidden
                }

                .xiaoxiBackground .xiaoxi.pattern:after {
                    content: "";
                    position: absolute;
                    left: 0;
                    right: 0;
                    bottom: -1000px;
                    top: -1000px;
                    -webkit-transform: skew(0, 12deg);
                    -ms-transform: skew(0, 12deg);
                    transform: skew(0, 12deg)
                }

                .common-xiaoxiGrid {
                    --xiaoxi-height: 48px;
                    --content-columns: 12;
                    --gutter-columns: 4;
                    position: absolute;
                    width: 100%;
                    top: 0;
                    bottom: 0;
                    z-index: -1;
                    pointer-events: none
                }

                @media (min-width:670px) {
                    .common-xiaoxiGrid {
                        --xiaoxi-height: 64px
                    }
                }

                .common-xiaoxiGrid .backgroundContainer,
                .common-xiaoxiGrid .xiaoxiContainer {
                    display: -ms-flexbox;
                    display: flex;
                    -ms-flex-direction: column;
                    flex-direction: column;
                    -ms-flex-align: center;
                    align-items: center;
                    position: absolute;
                    width: 100%;
                    height: 100%;
                    -webkit-transform: skewY(-12deg);
                    -ms-transform: skewY(-12deg);
                    transform: skewY(-12deg)
                }

                .common-xiaoxiGrid .backgroundContainer .grid {
                    grid-template-columns: 1fr;
                    min-width: 0
                }

                .common-xiaoxiGrid .backgroundContainer .background {
                    grid-row: 1/-1;
                    grid-column: 1/-1;
                    z-index: -1
                }

                .common-xiaoxiGrid .xiaoxiContainer {
                    overflow: hidden
                }

                .common-xiaoxiGrid.anchorBottom .backgroundContainer,
                .common-xiaoxiGrid.anchorBottom .xiaoxiContainer {
                    -ms-flex-pack: end;
                    justify-content: flex-end
                }

                .common-xiaoxiGrid.anchorBottom .grid {
                    height: 200%;
                    -ms-flex-line-pack: end;
                    align-content: end
                }

                .common-xiaoxiGrid .grid {
                    --content-column-width: minmax(0, calc(1040px / var(--content-columns)));
                    --gutter-column-width: 1fr;
                    position: absolute;
                    width: 100%;
                    height: 100%;
                    display: grid;
                    grid-template-rows: repeat(auto-fill, var(--xiaoxi-height));
                    grid-template-columns: [viewport-start] 1fr [left-gutter-start] repeat(var(--gutter-columns), var(--gutter-column-width)) [left-gutter-end content-start] repeat(var(--content-columns), var(--content-column-width)) [content-end right-gutter-start] repeat(var(--gutter-columns), var(--gutter-column-width)) [right-gutter-end] 1fr [viewport-end]
                }

                @media (min-width:1040px) {
                    .common-xiaoxiGrid .grid {
                        --gutter-column-width: var(--content-column-width);
                        min-width: calc(1040px / var(--content-columns) * (var(--gutter-columns) * 2 + var(--content-columns)))
                    }
                }
            </style>
            <style type="text/css">
                .benefit .common-xiaoxiGrid .xiaoxiContainer {
                    -ms-flex-pack: end;
                    justify-content: flex-end;
                    overflow: visible;
                    -webkit-transform-origin: 0 0;
                    -ms-transform-origin: 0 0;
                    transform-origin: 0 0
                }

                .benefit .common-xiaoxiGrid .grid {
                    height: auto;
                    grid-template-rows: repeat(7, var(--xiaoxi-height))
                }

                #stack .common-xiaoxiGrid {
                    top: calc(var(--xiaoxi-height) * -3)
                }

                #stack .common-xiaoxiGrid .grid {
                    height: auto;
                    grid-template-rows: repeat(7, var(--xiaoxi-height))
                }

                .page-header {
                    position: relative;
                    padding-top: 750px;
                    margin-bottom: 170px
                }

                .page-header:before {
                    content: "";
                    position: absolute;
                    z-index: -1;
                    left: 0;
                    top: 0;
                    right: 0;
                    background: #f6f9fc;
                    -webkit-transform: skewY(-12deg);
                    -ms-transform: skewY(-12deg);
                    transform: skewY(-12deg)
                }

                .page-header .common-xiaoxiGrid {
                    bottom: calc(var(--xiaoxi-height) * -5)
                }

                .page-header .background {
                    grid-row-end: -8 !important;
                    background-color: #f6f9fc
                }

                .page-header .xiaoxi:first-child {
                    grid-row-start: -15;
                    grid-column: left-gutter/5
                }

                .page-header .xiaoxi:nth-child(2) {
                    grid-row-start: -14;
                    grid-column: viewport-start/5
                }

                .page-header .xiaoxi:nth-child(3) {
                    grid-row-start: -10;
                    grid-column: left-gutter/7
                }

                .page-header .xiaoxi:nth-child(4) {
                    grid-row-start: -9;
                    grid-column: viewport-start/9
                }

                .page-header .xiaoxi:nth-child(5) {
                    grid-row-start: -8;
                    grid-column: 3/7
                }

                .page-header .xiaoxi:nth-child(6) {
                    grid-row-start: -6;
                    grid-column: left-gutter/4
                }

                .page-header .xiaoxi:nth-child(7) {
                    grid-row-start: -16;
                    grid-column: -7/right-gutter
                }

                .page-header .xiaoxi:nth-child(8) {
                    grid-row-start: -16;
                    grid-column: -5/right-gutter
                }

                .page-header .xiaoxi:nth-child(9) {
                    grid-row-start: -13;
                    grid-column: -6/-4
                }

                .page-header .xiaoxi:nth-child(10) {
                    grid-row-start: -13;
                    grid-column: -4/viewport-end
                }

                .page-header .xiaoxi:nth-child(11) {
                    grid-row-start: -12;
                    grid-column: -8/-3
                }

                .page-header .xiaoxi:nth-child(12) {
                    grid-row-start: -10;
                    grid-column: -8/viewport-end
                }

                .page-header .xiaoxi:nth-child(13) {
                    grid-row-start: -7;
                    grid-column: -11/-3
                }

                .page-header .xiaoxi:nth-child(14) {
                    grid-row-start: -6;
                    grid-column: -8/right-gutter
                }

                .page-header .xiaoxi:nth-child(15) {
                    grid-row-start: -5;
                    grid-column: -6/-4
                }

                .page-header .xiaoxi:nth-child(16) {
                    grid-row-start: -4;
                    grid-column: -4/right-gutter
                }

                .page-header .xiaoxi:nth-child(17) {
                    grid-row-start: -11;
                    grid-column: -7/-4
                }

                .page-header .xiaoxi:nth-child(18) {
                    grid-row-start: -9;
                    grid-column: -5/right-gutter
                }

                .page-header .xiaoxi2.s1 {
                    grid-row-start: -7;
                    grid-column: 13/span 3
                }

                .page-header .xiaoxi2.s2 {
                    grid-row-start: -3;
                    grid-column: viewport-start/left-gutter-start
                }

                .page-header .xiaoxi2.s3 {
                    grid-row-start: -6;
                    grid-column: 16/span 3
                }

                .page-header .xiaoxi2.s4 {
                    grid-row-start: -5;
                    grid-column: 17/span 4
                }

                .page-header .xiaoxi2.s5 {
                    grid-row-start: -7;
                    grid-column: 17/viewport-end
                }

                .page-header .xiaoxi2.s6 {
                    grid-row-start: -4;
                    grid-column: 18/span 2;
                    margin-top: -2px
                }

                .page-header .xiaoxi2.s7 {
                    grid-row-start: -16;
                    grid-column: 3/span 2
                }

                .page-header .xiaoxi2.s8 {
                    grid-row-start: -15;
                    grid-column: 2/span 2;
                    margin-top: -2px
                }

                .page-header .xiaoxi2.s9 {
                    grid-row-start: -11;
                    grid-column: -6/-3
                }

                .page-header .xiaoxi2.s10 {
                    grid-row-start: -12;
                    grid-column: -7/-4;
                    border-bottom: none
                }

                .page-header .xiaoxi2.s11 {
                    grid-row-start: -8;
                    grid-column: 4/span 2
                }

                .page-header .xiaoxi2.s12 {
                    grid-row-start: -8;
                    grid-column: viewport-start/span 3
                }

                .page-header .xiaoxi2.s13 {
                    grid-row-start: -7;
                    grid-column: 2/span 3
                }

                .page-header .xiaoxi2.s14 {
                    grid-row-start: -4;
                    grid-column: 3/span 2
                }

                .page-header .xiaoxi3:first-child {
                    grid-row-start: -16;
                    grid-column: 3/span 2
                }

                .page-header .xiaoxi3:nth-child(2) {
                    grid-row-start: -12;
                    grid-column: span 2/-5
                }

                .page-header .xiaoxi3:nth-child(3) {
                    grid-row-start: -10;
                    grid-column: span 5/-4
                }

                .page-header .xiaoxi3:nth-child(4) {
                    grid-row-start: -9;
                    grid-column: viewport-start/span 6
                }

                .page-header .xiaoxi3:nth-child(5) {
                    grid-row-start: -9;
                    grid-column: 7/span 1
                }

                .page-header .xiaoxi3:nth-child(6) {
                    grid-row-start: -9;
                    grid-column: span 7/viewport-end
                }

                .page-header .xiaoxi3:nth-child(7) {
                    grid-row-start: -8;
                    grid-column: span 4/content-end
                }

                .page-header .xiaoxi3:nth-child(8) {
                    grid-row-start: -8;
                    grid-column: right-gutter-start/right-gutter-end
                }

                .page-header .xiaoxi3:nth-child(9) {
                    grid-row-start: -7;
                    grid-column: span 3/-5
                }

                .page-header .xiaoxi4:first-child {
                    grid-row: -17;
                    grid-column: left-gutter-start/span 3
                }

                .page-header .xiaoxi4:nth-child(2) {
                    grid-row: -16;
                    grid-column: 4/span 2;
                    margin-top: -2px
                }

                .page-header .xiaoxi4:nth-child(3) {
                    grid-row: -15;
                    grid-row: -13;
                    grid-column: span 2/right-gutter-end
                }

                .page-header .xiaoxi4:nth-child(4) {
                    grid-row: -12;
                    grid-column: right-gutter-start/span 2
                }

                .page-header .xiaoxi4:nth-child(5) {
                    grid-row: -11;
                    grid-column: left-gutter-start/span 3
                }

                .page-header .xiaoxi4:nth-child(6) {
                    grid-row: -10;
                    grid-column: viewport-start/span 6
                }

                .page-header .xiaoxi4:nth-child(7) {
                    grid-row: -9;
                    grid-column: 3/span 3
                }

                .page-header .xiaoxi4:nth-child(8) {
                    grid-row: -9;
                    grid-column: 6/span 3
                }

                .page-header .xiaoxi4:nth-child(9) {
                    grid-row: -9;
                    grid-column: span 3/right-gutter-end
                }

                .page-header .xiaoxi4:nth-child(10) {
                    grid-row: -8;
                    grid-column: span 6/viewport-end
                }

                .page-header .xiaoxi4:nth-child(11) {
                    grid-row: -7;
                    grid-column: -8/span 2
                }

                .page-header .xiaoxi4:nth-child(12) {
                    grid-row: -7;
                    grid-column: -6/span 3
                }

                .page-header .xiaoxi4:nth-child(13) {
                    grid-row: -5;
                    grid-column: -5/span 2
                }

                .page-header .xiaoxi5:first-child {
                    grid-row: -15;
                    grid-column: span 4/6
                }

                .page-header .xiaoxi5:nth-child(2) {
                    grid-row: -14;
                    grid-column: span 4/4
                }

                .page-header .xiaoxi5:nth-child(3) {
                    grid-row: -11;
                    grid-column: span 3/8
                }

                .page-header .xiaoxi5:nth-child(4) {
                    grid-row: -10;
                    grid-column: viewport-start/span 4
                }

                .page-header .xiaoxi5:nth-child(5) {
                    grid-row: -9;
                    grid-column: span 7/9
                }

                .page-header .xiaoxi5:nth-child(6) {
                    grid-row: -9;
                    grid-column: span 5/7
                }

                .page-header .xiaoxi5:nth-child(7) {
                    grid-row: -14;
                    grid-column: span 4/viewport-end
                }

                .page-header .xiaoxi5:nth-child(8) {
                    grid-row: -13;
                    grid-column: span 5/viewport-end
                }

                .page-header .xiaoxi5:nth-child(9) {
                    grid-row: -8;
                    grid-column: span 7/viewport-end
                }

                .page-header .xiaoxi5:nth-child(10) {
                    grid-row: -7;
                    grid-column: span 3/-6
                }

                .page-header .xiaoxi5:nth-child(11) {
                    grid-row: -6;
                    grid-column: span 5/viewport-end
                }

                .lower-page {
                    position: relative;
                    margin-top: 240px;
                    padding-top: 300px
                }

                .lower-page:before {
                    content: "";
                    position: absolute;
                    z-index: -1;
                    left: 0;
                    top: 0;
                    right: 0;
                    bottom: -300px;
                    background: #f6f9fc;
                    -webkit-transform: skewY(-12deg);
                    -ms-transform: skewY(-12deg);
                    transform: skewY(-12deg)
                }

                .lower-page .common-xiaoxiGrid {
                    display: none;
                    top: calc(var(--xiaoxi-height) * -6)
                }

                .lower-page .common-xiaoxiGrid .grid {
                    height: auto;
                    grid-template-rows: repeat(10, var(--xiaoxi-height))
                }

                .lower-page .xiaoxi:first-child {
                    grid-row-start: 1;
                    grid-column: left-gutter/5
                }

                .lower-page .xiaoxi:nth-child(2) {
                    grid-row-start: 4;
                    grid-column: left-gutter/4
                }

                .lower-page .xiaoxi:nth-child(3) {
                    grid-row-start: 5;
                    grid-column: viewport-start/5
                }

                .lower-page .xiaoxi:nth-child(4) {
                    grid-row-start: 6;
                    grid-column: viewport-start/8
                }

                .lower-page .xiaoxi:nth-child(5) {
                    grid-row-start: 7;
                    grid-column: left-gutter/4
                }

                .lower-page .xiaoxi:nth-child(6) {
                    grid-row-start: 9;
                    grid-column: viewport-start/3
                }

                .lower-page .xiaoxi:nth-child(7) {
                    grid-row-start: 4;
                    grid-column: -4/right-gutter
                }

                .lower-page .xiaoxi:nth-child(8) {
                    grid-row-start: 7;
                    grid-column: -8/right-gutter
                }

                .lower-page .xiaoxi:nth-child(9) {
                    grid-row-start: 8;
                    grid-column: -4/viewport-end
                }

                .lower-page .xiaoxi:nth-child(10) {
                    grid-row-start: 10;
                    grid-column: -5/-3
                }

                .bottom-page {
                    margin-top: 100px
                }

                .bottom-page:before {
                    content: "";
                    position: absolute;
                    z-index: -1;
                    left: 0;
                    top: 0;
                    right: 0;
                    bottom: -1000px;
                    background: #32325d;
                    -webkit-transform: skewY(-12deg);
                    -ms-transform: skewY(-12deg);
                    transform: skewY(-12deg)
                }

                .bottom-page .xiaoxi:first-child {
                    grid-row-start: 4;
                    grid-column: 3/5
                }

                .bottom-page .xiaoxi:nth-child(2) {
                    grid-row-start: 6;
                    grid-column: left-gutter/content-start
                }

                .bottom-page .xiaoxi:nth-child(3) {
                    grid-row-start: 7;
                    grid-column: viewport-start/5
                }

                .bottom-page .xiaoxi:nth-child(4) {
                    grid-row-start: 9;
                    grid-column: left-gutter/4
                }

                .bottom-page .xiaoxi:nth-child(5) {
                    grid-row-start: 6;
                    grid-column: -6/-3
                }

                .bottom-page .xiaoxi:nth-child(6) {
                    grid-row-start: 7;
                    grid-column: -8/-5
                }

                .bottom-page .xiaoxi:nth-child(7) {
                    grid-row-start: 7;
                    grid-column: -5/viewport-end
                }

                .bottom-page .xiaoxi:nth-child(8) {
                    grid-row-start: 9;
                    grid-column: -5/-3
                }

                .bottom-page .xiaoxi:nth-child(9) {
                    grid-row-start: 10;
                    grid-column: -4/right-gutter
                }

                .bottom-page .background {
                    grid-row-end: -9 !important;
                    background-color: transparent
                }

                @media (min-width:670px) {
                    .benefit .common-xiaoxiGrid .xiaoxiContainer {
                        -ms-flex-pack: center;
                        justify-content: center
                    }

                    .page-header {
                        padding-top: 700px
                    }

                    .page-header .xiaoxi:first-child {
                        grid-column: left-gutter/5
                    }

                    .page-header .xiaoxi:nth-child(2) {
                        grid-column: viewport-start/5
                    }

                    .page-header .xiaoxi:nth-child(3) {
                        grid-column: left-gutter/4
                    }

                    .page-header .xiaoxi:nth-child(4) {
                        grid-column: viewport-start/content-start
                    }

                    .page-header .xiaoxi:nth-child(5) {
                        grid-column: 3/5
                    }

                    .page-header .xiaoxi:nth-child(7) {
                        grid-column: -4/right-gutter
                    }

                    .page-header .xiaoxi:nth-child(10) {
                        grid-row-start: -13;
                        grid-column: -4/viewport-end
                    }

                    .page-header .xiaoxi:nth-child(13) {
                        grid-row-start: -8;
                        grid-column: -6/-3
                    }

                    .lower-page {
                        margin-top: 200px
                    }

                    .lower-page .common-xiaoxiGrid {
                        display: block
                    }
                }

                @media (min-width:1040px) {
                    .benefit .common-xiaoxiGrid .xiaoxiContainer {
                        -webkit-transform-origin: calc(50vw - 520px) 0;
                        -ms-transform-origin: calc(50vw - 520px) 0;
                        transform-origin: calc(50vw - 520px) 0
                    }

                    .bottom-page:before {
                        bottom: -700px
                    }
                }

                @media (min-width:1160px) {
                    .lower-page .common-xiaoxiGrid {
                        display: block
                    }
                }
            </style>
            <style type="text/css">
                .xiaoxi.outline {
                    background: 0 0 !important;
                    -webkit-box-shadow: inset 0 0 0 2px #e6ebf1;
                    box-shadow: inset 0 0 0 2px #e6ebf1;
                    z-index: -1;
                    margin: 0 -2px
                }

                @media (min-width:670px) {
                    .xiaoxi.outline {
                        margin: 0
                    }
                }

                .xiaoxi.outline.slate2 {
                    -webkit-box-shadow: inset 0 0 0 2px #424770;
                    box-shadow: inset 0 0 0 2px #424770
                }

                .xiaoxi.shift-up {
                    -webkit-transform: translateY(-2px);
                    -ms-transform: translateY(-2px);
                    transform: translateY(-2px)
                }

                .xiaoxi.shift-down {
                    -webkit-transform: translateY(2px);
                    -ms-transform: translateY(2px);
                    transform: translateY(2px)
                }

                .xiaoxi.slate8 {
                    background: #e6ebf1
                }

                .xiaoxi.slate2 {
                    background: #525f7f
                }

                .xiaoxi.blue1 {
                    background: #32325d
                }

                .xiaoxi.blue4 {
                    background: #6772e5
                }

                .xiaoxi.yellow6 {
                    background: #fcd669
                }

                .xiaoxi.blue6 {
                    background: #87bbfd
                }

                .xiaoxi.green1 {
                    background-color: #d6facf
                }

                .xiaoxi.green2 {
                    background-color: #74e4a2
                }

                .xiaoxi.green3 {
                    background-color: #008169
                }

                .xiaoxi.green4 {
                    background-color: #06b27e
                }

                .xiaoxi.green5 {
                    background-color: #43d394
                }

                .xiaoxi2.gray {
                    border: 2px solid #e6ebf1
                }

                .xiaoxi2.gray.full {
                    background-color: #e6ebf1
                }

                .xiaoxi2.green1 {
                    background-color: #d6facf
                }

                .xiaoxi2.green2 {
                    background-color: #74e4a2
                }

                .xiaoxi2.green3 {
                    background-color: #008169
                }

                .xiaoxi2.green4 {
                    background-color: #06b27e
                }

                .xiaoxi2.green5 {
                    background-color: #43d394
                }

                .xiaoxi3.gray {
                    -webkit-box-shadow: inset 0 0 0 1.5px #e6ebf1;
                    box-shadow: inset 0 0 0 1.5px #e6ebf1
                }

                .xiaoxi3.gray.full {
                    background-color: #e6ebf1
                }

                .xiaoxi3.orange {
                    background-color: #ffbf74
                }

                .xiaoxi3.purple1 {
                    background-color: #8f6ed5
                }

                .xiaoxi3.purple2 {
                    background-color: #d782d9
                }

                .xiaoxi3.purple3 {
                    background-color: #7356b6
                }

                .xiaoxi4.gray {
                    -webkit-box-shadow: inset 0 0 0 1.5px #e6ebf1;
                    box-shadow: inset 0 0 0 1.5px #e6ebf1
                }

                .xiaoxi4.blue1 {
                    background-color: #c4f0ff
                }

                .xiaoxi4.blue2 {
                    background-color: #87bbfd
                }

                .xiaoxi4.blue3 {
                    background-color: #424770
                }

                .xiaoxi4.blue4 {
                    background-color: #6772e5
                }

                .xiaoxi5.gray {
                    -webkit-box-shadow: inset 0 0 0 1.5px #e6ebf1;
                    box-shadow: inset 0 0 0 1.5px #e6ebf1
                }

                .xiaoxi5.yellow {
                    background-color: #fcd669
                }

                .xiaoxi5.blue {
                    background-color: #32325d
                }

                .xiaoxi5.yellow2 {
                    background-color: #f5be58
                }

                .xiaoxi5.gray2 {
                    background-color: #e6ebf1
                }
            </style>
            <style type="text/css">
                .outline-section {
                    display: flex;
                    align-items: center;
                    justify-content: center
                }

                .outline-section .outline-div {
                    width: 80%;
                    max-width: 1000px;
                    display: flex
                }

                .outline-section .outline-div .outline-single {
                    width: 33.333%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex-direction: column
                }

                .outline-section .outline-div .outline-single .outline-single-title h4 {
                    font-weight: 400;
                    font-size: 24px;
                    line-height: 28px;
                    color: #525f7f;
                    margin-bottom: 0
                }

                .outline-section .outline-div .outline-single .outline-single-number {
                    display: flex;
                    align-items: flex-end;
                    flex-direction: row;
                    justify-content: center
                }

                .outline-section .outline-div .outline-single .outline-single-number .outline-icon {
                    padding-bottom: 34px;
                    margin-right: 20px
                }

                .outline-section .outline-div .outline-single .outline-single-number .outline-icon img {
                    height: 20px
                }

                .outline-section .outline-div .outline-single .outline-single-number .outline-span {
                    font-size: 60px;
                    color: #32325d;
                    margin-bottom: 12px;
                    margin-left: 4px;
                    font-weight: 600
                }

                @media only screen and (max-width:1200px) {
                    .outline-section .outline-div {
                        width: 90%
                    }
                }

                @media only screen and (max-width:992px) {
                    .outline-section .outline-div {
                        width: 95%
                    }
                }

                @media only screen and (max-width:768px) {
                    .outline-section .outline-div .outline-single .outline-single-title h4 {
                        font-weight: 400;
                        font-size: 20px;
                        line-height: 24px
                    }

                    .outline-section .outline-div .outline-single .outline-single-number .outline-icon {
                        padding-bottom: 28px;
                        margin-right: 13px
                    }

                    .outline-section .outline-div .outline-single .outline-single-number .outline-icon img {
                        height: 16px
                    }

                    .outline-section .outline-div .outline-single .outline-single-number .outline-span {
                        font-size: 30px;
                        margin-bottom: 17px;
                        margin-left: 4px
                    }
                }

                @media only screen and (max-width:576px) {
                    .outline-section .outline-div {
                        display: flex;
                        justify-content: center;
                        flex-direction: column;
                        align-items: center
                    }

                    .outline-section .outline-div .outline-single {
                        width: 100%;
                        margin-top: 40px
                    }
                }

                .stack-section {

                    margin-top: 100px;
                    padding: 100px 0;
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    align-items: center
                }

                .stack-section .intro {
                    margin-bottom: 60px
                }

                .stack-section .intro h2 {
                    font-weight: 300
                }

                .stack-section .intro h2,
                .stack-section .intro span {
                    text-align: center;
                    font-size: 32px;
                    color: #32325d;
                    letter-spacing: .6px
                }

                .stack-section .intro span {
                    font-weight: 600
                }

                .stack-section .stack-div {
                    width: 70%;
                    max-width: 1000px;
                    display: flex;
                    height: 100%;
                    flex-direction: column
                }

                .stack-section .stack-div .stack-single-div {
                    width: 100%;
                    display: flex
                }

                .stack-section .stack-div .stack-single-div .stack-desc {
                    width: 35%;
                    margin-left: 5%;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    height: 124px
                }

                .stack-section .stack-div .stack-single-div .stack-desc h4 {
                    font-size: 17px;
                    line-height: 26px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: .025em;
                    color: #32325d
                }

                .stack-section .stack-div .stack-single-div .stack-desc p {
                    font-weight: 400;
                    font-size: 17px;
                    line-height: 28px;
                    color: #525f7f;
                    margin-bottom: 0
                }

                .stack-section .stack-div .stack-single-div .stack-pic {
                    margin-right: 5%;
                    width: 65%;
                    display: flex;
                    flex-direction: row;
                    padding: 7px;
                    border-radius: 18px;
                    background-color: #fff;
                    box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(50, 50, 93, .15), 0 5px 15px rgba(0, 0, 0, .1);
                    margin-bottom: 30px
                }

                .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component {
                    width: 25%;
                    margin: 5px;
                    height: 100px;
                    background: rgba(67, 211, 148, .2);
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    flex-direction: column;
                    justify-content: center
                }

                .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component img {
                    margin: 8px 0
                }

                .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component h4 {
                    color: #525f7f;
                    font-size: 17px;
                    font-weight: 400
                }

                .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component:focus,
                .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component:hover {
                    -webkit-transform: translateY(-1px);
                    transform: translateY(-1px);
                    -webkit-box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(0, 0, 0, .08);
                    box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px rgba(0, 0, 0, .08);
                    text-decoration: none
                }

                .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component:active {
                    text-decoration: none
                }

                .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component-two {
                    width: 50%
                }

                .stack-section .stack-div .stack-single-div .stack-pic .stack-pic-dashed .stack-pic-dashed-x {
                    border: 2px dashed #7795f8;
                    border-radius: 12px;
                    height: 47.5px;
                    opacity: .5;
                    margin: 5px
                }

                .stack-section .stack-div .stack-single-div .stack-pic .stack-pic-dashed .stack-pic-dashed-y {
                    border: 2px dashed #7795f8;
                    border-radius: 12px;
                    height: 100px;
                    opacity: .5;
                    margin: 5px
                }

                .one-tenth {
                    width: 10%
                }

                .two-tenth {
                    width: 20%
                }

                .three-tenth {
                    width: 30%
                }

                @media only screen and (max-width:1200px) {
                    .stack-section .stack-div {
                        width: 80%
                    }
                }

                @media only screen and (max-width:992px) {
                    .stack-section .stack-div {
                        width: 90%
                    }
                }

                @media only screen and (max-width:768px) {
                    .stack-section .intro h2 {
                        font-size: 26px;
                        line-height: 36px
                    }

                    .stack-section .stack-div .stack-single-div {
                        display: flex;
                        flex-direction: column;
                        align-items: center
                    }

                    .stack-section .stack-div .stack-single-div .stack-desc {
                        margin: 40px 0;
                        text-align: center;
                        width: 80%
                    }

                    .stack-section .stack-div .stack-single-div .stack-pic {
                        margin: 0;
                        width: 80%
                    }
                }

                @media only screen and (max-width:576px) {

                    .stack-section .stack-div .stack-single-div .stack-desc,
                    .stack-section .stack-div .stack-single-div .stack-pic {
                        width: 90%
                    }

                    .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component h4 {
                        font-size: 12px
                    }
                }

                @media only screen and (max-width:480px) {

                    .stack-section .stack-div .stack-single-div .stack-desc,
                    .stack-section .stack-div .stack-single-div .stack-pic {
                        width: 95%
                    }

                    .stack-section .stack-div .stack-single-div .stack-pic .stack-single-component h4 {
                        font-size: 0
                    }
                }

                .users {
                    background: #fff;
                    padding: 100px 0;
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    align-items: center
                }

                .users .intro {
                    width: 70%;
                    max-width: 1000px;
                    margin-bottom: 60px
                }

                .users .intro h2 {
                    font-weight: 300
                }

                .users .intro h2,
                .users .intro span {
                    text-align: center;
                    font-size: 32px;
                    color: #32325d;
                    letter-spacing: .6px
                }

                .users .intro span {
                    font-weight: 600
                }

                .users .images {
                    width: 70%;
                    max-width: 1000px
                }

                .users .images .image-row {
                    display: flex
                }

                .users .images .image-row .image-single {
                    margin: 1%
                }

                .users .images .image-row .image-single img {
                    width: 90%
                }

                @media only screen and (max-width:768px) {
                    .users .intro h2 {
                        font-size: 26px;
                        line-height: 36px
                    }
                }

                .highlight-home .highlight-part-one-desc {
                    margin-top: 40px
                }

                .highlight-home .highlight-part-one-pic {
                    height: 100%
                }

                .highlight-home .highlight-part-one-pic .highlight-image {
                    height: 320px;
                    overflow: hidden;
                    display: flex;
                    justify-content: center
                }

                .highlight-home .highlight-part-one-pic .highlight-image img {
                    height: 100%
                }

                .highlight-home .highlight-part-two-desc {
                    margin-top: 40px
                }

                .highlight-home .highlight-part-two-pic {
                    height: 100%
                }

                .highlight-home .highlight-part-two-pic .highlight-image {
                    height: 320px;
                    overflow: hidden;
                    display: flex
                }

                .highlight-home .highlight-part-two-pic .highlight-image img {
                    height: 100%
                }

                .highlight-home .highlight-part-three-desc {
                    margin-top: 40px
                }

                .highlight-home .highlight-part-three-pic {
                    height: 100%
                }

                .highlight-home .highlight-part-three-pic .highlight-image {
                    height: 320px;
                    overflow: hidden;
                    display: flex;
                    justify-content: center
                }

                .highlight-home .highlight-part-three-pic .highlight-image img {
                    height: 100%
                }

                @media only screen and (max-width:992px) {

                    .highlight-home .highlight-part-one-pic,
                    .highlight-home .highlight-part-two-pic {
                        margin-top: 0
                    }

                    .highlight-home .highlight-part-three-pic img {
                        height: 300px
                    }
                }

                .home-banner-section {
                    margin-top: -880px;
                    padding-top: 64px
                }

                .home-outline-section {
                    padding-top: 50px
                }

                .home-safety-section {
                    margin-top: -150px
                }

                .home-user-section {
                    background: #fff
                }
            </style>

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

                img {
                    vertical-align: middle;
                    border-style: none
                }

                svg:not(:root) {
                    overflow: hidden
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
                    vertical-align: middle;
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

                .common-button-light {
                    color: #6772e5;
                    background: #fff
                }

                .common-button-light:focus,
                .common-button-light:hover {
                    color: #7795f8;
                    background-color: #fff
                }

                .common-button-light:active {
                    color: #e6ebf1;
                    background-color: #555abf
                }

                .banner-div {
                    height: 526px;
                    width: 100%;
                    max-width: 1500px;
                    margin: auto;
                    position: relative
                }

                .banner-div .banner-title-div {
                    height: 245px;
                    width: 40%;
                    position: absolute;
                    left: 15%;
                    max-width: 480px;
                    top: 0;
                    bottom: 0;
                    margin: auto;
                    z-index: 1
                }

                .banner-div .banner-title-div>* {
                    will-change: transform
                }

                .banner-div .banner-title-div h1 {
                    font-family: Futura, Helvetica Neue For Number, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, PingFang SC, Hiragino Sans GB, Microsoft YaHei, Helvetica Neue, Helvetica, Arial, sans-serif;
                    font-size: 54px;
                    letter-spacing: 1.4px;
                    margin: 12px 0;
                    color: #32325d
                }

                .banner-div .banner-title-div p {
                    font-size: 20px;
                    letter-spacing: .6px;
                    color: #525f7f;
                    line-height: 38px
                }

                .banner-div .banner-title-div .title-line-wrapper {
                    height: 2px;
                    width: 100%;
                    overflow: hidden
                }

                .banner-div .banner-title-div .title-line-wrapper .title-line {
                    height: 100%;
                    width: 64px;
                    transform: translateX(-64px);
                    background: linear-gradient(90deg, rgba(103, 114, 229, 0) 0, #6772e5);
                    animation: bannerTitleLine 3s ease-in-out 0s infinite
                }

                @media only screen and (max-width:1200px) {
                    .banner-div {
                        padding-top: 40px
                    }

                    .banner-div .banner-title-div h1 {
                        font-size: 36px
                    }

                    .banner-div .banner-title-div p {
                        font-size: 16px
                    }
                }

                @media only screen and (max-width:992px) {
                    .banner-div {
                        background-position: 40%
                    }
                }

                @media only screen and (max-width:768px) {
                    .banner-div {
                        margin-top: 40px;
                        height: 100%;
                        width: 80%;
                        overflow: hidden
                    }

                    .banner-div .banner-title-div {
                        display: block;
                        position: static;
                        width: 100%;
                        height: auto;
                        text-align: center;
                        max-width: 480px
                    }
                }

                @media only screen and (max-width:480px) {
                    .banner-div .banner-title-div h1 {
                        font-size: 28px
                    }

                    .banner-div .banner-title-div p {
                        font-size: 16px
                    }
                }

                .highlight {
                    padding-top: 110px;
                    padding-bottom: 60px;
                    display: flex;
                    flex-direction: column;
                    align-items: center
                }

                .highlight .highlight-part {
                    margin-bottom: 60px;
                    margin-top: 40px;
                    flex-direction: row;
                    justify-content: center;
                    display: flex;
                    width: 70%;
                    max-width: 1000px
                }

                .highlight .highlight-part h2 {
                    font-weight: 300;
                    font-size: 32px;
                    color: #32325d;
                    margin-bottom: 16px;
                    line-height: 48px;
                    letter-spacing: .6px
                }

                .highlight .highlight-part p {
                    font-size: 18px;
                    line-height: 36px;
                    margin-bottom: 10px;
                    color: #424770;
                    font-weight: 300
                }

                .highlight-left {
                    width: 45%;
                    margin-right: 5%;
                    height: 350px
                }

                .highlight-right {
                    width: 45%;
                    margin-left: 5%;
                    height: 350px
                }

                @media only screen and (max-width:1200px) {
                    .highlight .highlight-part {
                        width: 80%
                    }
                }

                @media only screen and (max-width:992px) {
                    .highlight .highlight-part {
                        align-items: center;
                        width: 90%
                    }

                    .highlight .highlight-part h2 {
                        font-size: 26px;
                        line-height: 38px;
                        letter-spacing: .4px
                    }

                    .highlight .highlight-part p {
                        font-size: 14px;
                        line-height: 26px
                    }

                    .highlight-left,
                    .highlight-right {
                        height: 300px !important
                    }
                }

                @media only screen and (max-width:576px) {
                    .highlight .highlight-part h2 {
                        text-align: center;
                        margin-bottom: 28px
                    }
                }
            </style>

            <div id="root">
                <div style="height:100%">
                    <div>

                        <div style="height: 100%;">
                            <div class="page-header">
                                <div class="common-xiaoxiGrid anchorBottom">
                                    <div class="backgroundContainer">
                                        <div class="grid">
                                            <div class="background"></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="home-banner-section">
                                <div class="banner-div" style="padding-top: 140px;">
                                    <div class="banner-title-div"
                                         style="width: 100%; text-align: center; display: flex; flex-direction: column; align-items: center; position: relative; left: 0px;">
                                        <div class="title-line-wrapper"
                                             style="opacity: 1; transform: translate(0px, 0px);">
                                            <div class="title-line"
                                                 style="transform: translateX(-64px); background: linear-gradient(to right, rgba(62, 207, 142, 0) 0%, rgb(62, 207, 142) 100%);">
                                            </div>
                                        </div>
                                        <a class="img_a" href="/toProfile"><img src="/directory2/img/profile.jpeg" width="300"/></a><br>
                                        <a href="/toProfile">
                                            <p style="opacity: 1; transform: translate(0px, 0px);" class="">
                                                <strong>您还没有编辑简历，或者您的简历信息不全！点击此处上传简历，开启个人专属定制岗位推荐服务</strong></p>
                                        </a>

                                    </div>
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