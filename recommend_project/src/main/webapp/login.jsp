<%--
  Created by IntelliJ IDEA.
  User: sdu2018lzq
  Date: 2021/6/3
  Time: 15:39
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

    <title>欢迎登录</title>

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

    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">

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
            <a href="#"><img src="/directory2/img/xiaofei.png" alt=""/></a>

        </nav>

        <main class="content" style="background-image: url('directory2/img/loginBackground.jpg');background-size: 100% 100%;background-attachment: fixed">

            <div class="col-12 col-xl-6">
                <div class="card col-sm-8" style="float: right">
                    <div class="card-header">
                        <h1 class="card-title" style="font-size: x-large">欢迎登录</h1>
                    </div>
                    <div class="card-body">
                        <form method="post" id="toRegister" action="/toRegister">
                        </form>
                        <form method="post" action="/login">
                            <div class="form-group row">
                                <label class="col-form-label col-sm-3 text-sm-right">账号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="phoneNumber" placeholder="您的手机号码">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-3 text-sm-right">密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" name="password" placeholder="请输入密码">
                                </div>
                            </div>

                            <div class="form-group" style="display:inline;align-content: center">
                                <label class="col-form-label col-sm-3 text-sm-right"></label>
                                <div class="col-sm-10 ml-sm-auto" style="display:inline">
                                    <button type="submit" class="btn btn-primary" style="display:inline;">登录</button>
                                </div>
                                <div class="col-sm-10 ml-sm-auto" style="display:inline">
                                    <button form="toRegister" type="submit" class="btn btn-primary" style="display:inline;"
                                           >注册</button>
                                </div>
                            </div>
                        </form>
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