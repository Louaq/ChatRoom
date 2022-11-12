<%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/11/2
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎使用Buyer Forum平台</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .aStyle {
            text-decoration: none;
        }

        .aStyle:hover {
            color: mediumspringgreen !important;
        }

        .btn-secondary,
        .btn-secondary:hover,
        .btn-secondary:focus {
            color: #333;
            text-shadow: none; /* Prevent inheritance from `body` */
        }


        /*
         * Base structure
         */

        body {
            text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
            box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);
        }

        .cover-container {
            max-width: 42em;
        }


        .nav-masthead .nav-link {
            color: rgba(255, 255, 255, .5);
            border-bottom: .25rem solid transparent;
        }

        .nav-masthead .nav-link:hover,
        .nav-masthead .nav-link:focus {
            border-bottom-color: rgba(255, 255, 255, .25);
        }

        .nav-masthead .nav-link + .nav-link {
            margin-left: 1rem;
        }

        .nav-masthead .active {
            color: #fff;
            border-bottom-color: #fff;
        }

    </style>
</head>
<body class="d-flex h-100 text-center text-bg-dark">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div>
            <h3 class="float-md">Buyer Forum</h3>
        </div>
    </header>

    <main class="px-3">
        <h1>Buy or not ?</h1>
        <br>
        <p class="lead">还在为每一次遇到在网上购物产品的质量、好坏而犹豫吗？没关系，Buyer Forum就是专门为各位买家开发的一个平台。大家不仅能在上面选购产品，而且能和其他买家一起交流分享经验。</p>
        <p class="lead">
            <br>
            <a href="login.jsp" class="btn btn-lg btn-secondary fw-bold border-white bg-white">let's go!</a>
        </p>
    </main>

    <footer class="mt-auto text-white-50">
        <p>Designed and developed by<a href="https://github.com/ABF7470"
                                       class="text-white aStyle">&nbsp;Yangyang&nbsp;</a>and<a
                href="https://github.com/Qddl925"
                class="text-white aStyle">&nbsp;Tuo Xiaodong&nbsp;</a>.</p>
    </footer>
</div>


</body>
</html>
