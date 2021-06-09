<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sdu2018lzq
  Date: 2021/6/5
  Time: 20:31
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

    <title>行业分析</title>

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

                <li class="sidebar-item active">
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
                <div style="display: inline">
                    <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                        <span class="text-dark">选择城市</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left">
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse北京"> 北京</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse上海"> 上海</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse广州"> 广州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse深圳"> 深圳</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse南京"> 南京</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse杭州"> 杭州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse苏州"> 苏州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse宁波"> 宁波</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse青岛"> 青岛</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse济南"> 济南</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse福州"> 福州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse厦门"> 厦门</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse成都"> 成都</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse重庆"> 重庆</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse天津"> 天津</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse西安"> 西安</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse武汉"> 武汉</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse长沙"> 长沙</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse郑州"> 郑州</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse合肥"> 合肥</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse昆明"> 昆明</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse东莞"> 东莞</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse大连"> 大连</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse沈阳"> 沈阳</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse长春"> 长春</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyse哈尔滨"> 哈尔滨</a>
                    </div>
                </div>

                <div style="display: inline">
                    <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                        <span class="text-dark">选择行业</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left">
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse计算机"> 计算机</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse互联网"> 互联网</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse通信"> 通信</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse电子"> 电子</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse销售"> 销售</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse客服"> 客服</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse会计"> 会计</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse金融"> 金融</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse银行"> 银行</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse保险"> 保险</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse生产"> 生产</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse机械"> 机械</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse汽车"> 汽车</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse运营"> 运营</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse采购"> 采购</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse物流"> 物流</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse服装"> 服装</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse建筑"> 建筑</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse房地产"> 房地产</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse设计"> 设计</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse市场"> 市场</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse媒体"> 媒体</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse广告"> 广告</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse人事"> 人事</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse行政"> 行政</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse教育"> 教育</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse培训"> 培训</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse生物"> 生物</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse制药"> 制药</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse化工"> 化工</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse医疗"> 医疗</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse顾问"> 顾问</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse法律"> 法律</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse交通"> 交通</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyse翻译"> 翻译</a>
                    </div>
                </div>

                <div style="display: inline">
                    <a class="nav-link d-none d-sm-inline-block">
                        <c:if test="${sessionScope.isIndustry == true}">
                            <span class="text-dark">当前选择行业：${sessionScope.industry} </span>
                        </c:if>
                        <c:if test="${sessionScope.isIndustry == false}">
                            <span class="text-dark">当前选择城市：${sessionScope.city} </span>
                        </c:if>
                    </a>
                </div>
            </div>

            <div class="container-fluid p-0">
                <c:if test="${sessionScope.isIndustry == true}">
                    <h1 class="h3 mb-3"><%=session.getAttribute("industry")%>行业的热门城市平均薪资水平</h1>
                </c:if>
                <c:if test="${sessionScope.isIndustry == false}">
                    <h1 class="h3 mb-3"><%=session.getAttribute("city")%>市的各行业平均薪资水平</h1>
                </c:if>

                <div class="row">

                    <div class="col-12 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                            </div>
                            <div class="card-body">
                                <div class="chart">
                                    <canvas id="chartjs-bar"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">具体数据</h3>
                            </div>
                            <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th scope="col">最高年薪平均的排名</th>
                                        <c:if test="${sessionScope.isIndustry == true}">
                                            <th scope="col">城市</th>
                                        </c:if>
                                        <c:if test="${sessionScope.isIndustry == false}">
                                            <th scope="col">行业</th>
                                        </c:if>
                                        <th scope="col">最高年薪的平均</th>
                                        <th scope="col">最低年薪的平均</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="i" begin="0" end="${sessionScope.cityNameList.size()-1}">
                                        <tr>
                                            <th scope="row">${i+1}</th>
                                            <c:if test="${sessionScope.isIndustry == true}">
                                                <td>${sessionScope.cityNameList.get(i)}市</td>
                                            </c:if>
                                            <c:if test="${sessionScope.isIndustry == false}">
                                                <td>${sessionScope.cityNameList.get(i)}</td>
                                            </c:if>
                                            <td>${sessionScope.maxSalaryData.get(i)}</td>
                                            <td>${sessionScope.minSalaryData.get(i)}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
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
<script>
    $(function() {
        // Bar chart
        new Chart(document.getElementById("chartjs-bar"), {
            type: "bar",
            data: {
                labels: <%=session.getAttribute("cityLabelsList")%>,
                datasets: [{
                    label: "最高年薪的平均",
                    backgroundColor: window.theme.primary,
                    borderColor: window.theme.primary,
                    hoverBackgroundColor: window.theme.primary,
                    hoverBorderColor: window.theme.primary,
                    data: <%=session.getAttribute("maxSalaryData")%>,
                    barPercentage: .75,
                    categoryPercentage: .5
                }, {
                    label: "最低年薪的平均",
                    backgroundColor: "#dee2e6",
                    borderColor: "#dee2e6",
                    hoverBackgroundColor: "#dee2e6",
                    hoverBorderColor: "#dee2e6",
                    data: <%=session.getAttribute("minSalaryData")%>,
                    barPercentage: .75,
                    categoryPercentage: .5
                }]
            },
            options: {
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        gridLines: {
                            display: false
                        },
                        stacked: false,
                        ticks: {
                            stepSize: 20
                        }
                    }],
                    xAxes: [{
                        stacked: false,
                        gridLines: {
                            color: "transparent"
                        }
                    }]
                }
            }
        });
    });
</script>

</body>

</html>
