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

    <title>θ‘δΈεζ</title>

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
                        <i class="align-middle" data-feather="list"></i> <span class="align-middle">ε²δ½ζ¨θ</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/selectCityδΈζ΅·">
                        <i class="align-middle" data-feather="eye"></i> <span class="align-middle">ε²δ½ζη΄’</span>
                    </a>
                </li>

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="/toCityAnalyseεδΊ¬">
                        <i class="align-middle" data-feather="bar-chart-2"></i> <span class="align-middle">θ‘δΈεζ</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="#ui" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="star"></i> <span class="align-middle">ζηζΆθ</span>
                    </a>
                    <ul id="ui" class="sidebar-dropdown list-unstyled " data-parent="#sidebar">
                        <c:forEach var="myCollection" items="${sessionScope.allMyCollections}" varStatus="no">
                            <li class="sidebar-item">
                                <a class="sidebar-link"
                                   href="/toDetailsPage${myCollection.getJid()}"
                                   title="ε¬εΈεοΌ${myCollection.getCompName()}
ε·₯δ½εεΈοΌ${myCollection.getCity()}
ε²δ½η±»ε«οΌ${myCollection.getType()}
θͺθ΅οΌ${myCollection.getSal()}
">
                                        ${myCollection.getPosName()}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <!--                <li class="sidebar-item">-->
                <!--                    <a class="sidebar-link" href="pages-settings.html">-->
                <!--                        <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">ιεΊη»ε½</span>-->
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
                                                                                                            data-feather="user"></i> ζηη?ε</a>
                            <a class="dropdown-item" href="/login1"><i class="align-middle mr-1" data-feather="home"></i> εε°δΈ»ι‘΅</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/toAboutUs"><i class="align-middle mr-1"
                                                                 data-feather="help-circle"></i> εΈ?ε©</a>
                            <a class="dropdown-item" href="/toLogin"><i class="align-middle mr-1" data-feather="log-out"></i> ιεΊη»ε½</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="content">

            <div class="row" style="height: 80px">
                <div style="display: inline">
                    <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                        <span class="text-dark">ιζ©εεΈ</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left">
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseεδΊ¬"> εδΊ¬</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseδΈζ΅·"> δΈζ΅·</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseεΉΏε·"> εΉΏε·</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseζ·±ε³"> ζ·±ε³</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseεδΊ¬"> εδΊ¬</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseζ­ε·"> ζ­ε·</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseθε·"> θε·</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseε?ζ³’"> ε?ζ³’</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseιε²"> ιε²</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseζ΅ε"> ζ΅ε</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseη¦ε·"> η¦ε·</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseε¦ι¨"> ε¦ι¨</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseζι½"> ζι½</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseιεΊ"> ιεΊ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseε€©ζ΄₯"> ε€©ζ΄₯</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseθ₯Ώε?"> θ₯Ώε?</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseζ­¦ζ±"> ζ­¦ζ±</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseιΏζ²"> ιΏζ²</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseιε·"> ιε·</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseεθ₯"> εθ₯</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseζζ"> ζζ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseδΈθ"> δΈθ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseε€§θΏ"> ε€§θΏ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseζ²ι³"> ζ²ι³</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseιΏζ₯"> ιΏζ₯</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toCityAnalyseεε°ζ»¨"> εε°ζ»¨</a>
                    </div>
                </div>

                <div style="display: inline">
                    <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                        <span class="text-dark">ιζ©θ‘δΈ</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left">
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseθ?‘η?ζΊ"> θ?‘η?ζΊ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseδΊθη½"> δΊθη½</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseιδΏ‘"> ιδΏ‘</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseη΅ε­"> η΅ε­</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseιε?"> ιε?</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseε?’ζ"> ε?’ζ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseδΌθ?‘"> δΌθ?‘</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseιθ"> ιθ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseιΆθ‘"> ιΆθ‘</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseδΏι©"> δΏι©</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseηδΊ§"> ηδΊ§</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseζΊζ’°"> ζΊζ’°</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseζ±½θ½¦"> ζ±½θ½¦</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseθΏθ₯"> θΏθ₯</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseιθ΄­"> ιθ΄­</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseη©ζ΅"> η©ζ΅</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseζθ£"> ζθ£</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseε»Ίη­"> ε»Ίη­</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseζΏε°δΊ§"> ζΏε°δΊ§</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseθ?Ύθ?‘"> θ?Ύθ?‘</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseεΈεΊ"> εΈεΊ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseεͺδ½"> εͺδ½</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseεΉΏε"> εΉΏε</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseδΊΊδΊ"> δΊΊδΊ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseθ‘ζΏ"> θ‘ζΏ</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseζθ²"> ζθ²</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseεΉθ?­"> εΉθ?­</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseηη©"> ηη©</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseεΆθ―"> εΆθ―</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseεε·₯"> εε·₯</a>
                        <a style="display: block; padding: .35rem 1.5rem"></a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseε»η"> ε»η</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseι‘Ύι?"> ι‘Ύι?</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseζ³εΎ"> ζ³εΎ</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseδΊ€ι"> δΊ€ι</a>
                        <a class="dropdown-item" style="display: inline"
                           href="/toIndustryAnalyseηΏ»θ―"> ηΏ»θ―</a>
                    </div>
                </div>

                <div style="display: inline">
                    <a class="nav-link d-none d-sm-inline-block">
                        <c:if test="${sessionScope.isIndustry == true}">
                            <span class="text-dark">ε½ειζ©θ‘δΈοΌ${sessionScope.industry} </span>
                        </c:if>
                        <c:if test="${sessionScope.isIndustry == false}">
                            <span class="text-dark">ε½ειζ©εεΈοΌ${sessionScope.city} </span>
                        </c:if>
                    </a>
                </div>
            </div>

            <div class="container-fluid p-0">
                <c:if test="${sessionScope.isIndustry == true}">
                    <h1 class="h3 mb-3"><%=session.getAttribute("industry")%>θ‘δΈηη­ι¨εεΈεΉ³εθͺθ΅ζ°΄εΉ³</h1>
                </c:if>
                <c:if test="${sessionScope.isIndustry == false}">
                    <h1 class="h3 mb-3"><%=session.getAttribute("city")%>εΈηεθ‘δΈεΉ³εθͺθ΅ζ°΄εΉ³</h1>
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
                                <h3 class="card-title">ε·δ½ζ°ζ?</h3>
                            </div>
                            <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th scope="col">ζι«εΉ΄θͺεΉ³εηζε</th>
                                        <c:if test="${sessionScope.isIndustry == true}">
                                            <th scope="col">εεΈ</th>
                                        </c:if>
                                        <c:if test="${sessionScope.isIndustry == false}">
                                            <th scope="col">θ‘δΈ</th>
                                        </c:if>
                                        <th scope="col">ζι«εΉ΄θͺηεΉ³ε</th>
                                        <th scope="col">ζδ½εΉ΄θͺηεΉ³ε</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="i" begin="0" end="${sessionScope.cityNameList.size()-1}">
                                        <tr>
                                            <th scope="row">${i+1}</th>
                                            <c:if test="${sessionScope.isIndustry == true}">
                                                <td>${sessionScope.cityNameList.get(i)}εΈ</td>
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
                            <a href="index.html" class="text-muted"><strong>ε°ι£ζΊθ½</strong></a> &copy;
                        </p>
                    </div>
                    <div class="col-6 text-right">
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">ε³δΊζδ»¬</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">εΈ?ε©</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">εε°ι‘Άι¨</a>
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
                    label: "ζι«εΉ΄θͺηεΉ³ε",
                    backgroundColor: window.theme.primary,
                    borderColor: window.theme.primary,
                    hoverBackgroundColor: window.theme.primary,
                    hoverBorderColor: window.theme.primary,
                    data: <%=session.getAttribute("maxSalaryData")%>,
                    barPercentage: .75,
                    categoryPercentage: .5
                }, {
                    label: "ζδ½εΉ΄θͺηεΉ³ε",
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
