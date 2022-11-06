<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>欢迎使用Buyer Forum聊天室</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.bundle.min.js"></script>
    <style>
        .container {
            width: auto;
            max-width: 680px;
            padding: 0 15px;
        }

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

        .carousel .item {
            height: 500px;
            background-color: #777;
        }

        .carousel-inner > .item > img {
            position: absolute;
            top: 0;
            left: 0;
            min-width: 100%;
            height: 500px;
        }

        #makeBig {
            height: 200px;
        }

        .massageIn {
            position: relative;
            height: 120px;
            width: 100%;
            /* background-color: #2470dc; */
            /* border: #727272 solid 2px; */
            border-radius: 10px;
        }

        /* 输入框样式 */
        .massageIn iframe {
            margin-top: 2px;
            width: 100%;
            height: 90px;
            border: #727272 solid 2px;
            border-radius: 5px;
            font-size: 20px;
        }

        /* 发送按钮 */
        .massageIn button {
            width: 100px;
            height: 40px;
            font-size: 22px;
            font-family: 'kaiti';
            font-weight: 700;
            position: absolute;
            left: 50%;
            top: 70%;
            transform: translateX(-50%);
            border-radius: 10px;
            background-color: ivory;
        }

        body {
            font-size: .875rem;
        }

        .feather {
            width: 16px;
            height: 16px;
        }

        /*
     * Sidebar
     */

        .sidebar {
            position: fixed;
            top: 0;
            /* rtl:raw:
        right: 0;
        */
            bottom: 0;
            /* rtl:remove */
            left: 0;
            z-index: 100;
            /* Behind the navbar */
            padding: 48px 0 0;
            /* Height of navbar */
            box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
        }

        @media (max-width: 767.98px) {
            .sidebar {
                top: 5rem;
            }
        }

        .sidebar-sticky {
            height: calc(100vh - 48px);
            overflow-x: hidden;
            overflow-y: auto;
            /* Scrollable contents if viewport is shorter than content. */
        }

        .sidebar .nav-link {
            font-weight: 500;
            color: #333;
        }

        .sidebar .nav-link .feather {
            margin-right: 4px;
            color: #727272;
        }

        .sidebar .nav-link.active {
            color: #2470dc;
        }

        .sidebar .nav-link:hover .feather,
        .sidebar .nav-link.active .feather {
            color: inherit;
        }

        .sidebar-heading {
            font-size: .75rem;
        }

        /*
     * Navbar
     */

        .navbar-brand {
            padding-top: .75rem;
            padding-bottom: .75rem;
            background-color: rgba(0, 0, 0, .25);
            box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
        }

        .navbar .navbar-toggler {
            top: .25rem;
            right: 1rem;
        }

        .navbar .form-control {
            padding: .75rem 1rem;
        }

        .form-control-dark {
            color: #fff;
            background-color: rgba(255, 255, 255, .1);
            border-color: rgba(255, 255, 255, .1);
        }

        .form-control-dark:focus {
            border-color: transparent;
            box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
        }

        /* 展示在线朋友 */
        #showFriend {
            height: 661px;
            width: 16.6%;
            background-color: blanchedalmond;
            border-right: #727272 solid 3px;
            display: inline-block;
        }
    </style>
</head>
<body>
<!-- 轮播图开始 -->
<div id="myCarousel" class="carousel slide" data-bs-ride="carousel" style="height: 220px;">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true"
                aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active" style="height: 220px;">
            <img src="./images/cool-background (4).png" alt="">

            <div class="container">
                <div class="carousel-caption text-start">
                    <h1>Buyer Forum</h1>
                    <h4>一个专门为年轻人设计的购物&聊天的一站式平台</h4>
                    <h5>Designed by Yang-yang and Tuo-Xiaodong</h5>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="height: 220px;">
            <!-- 背景图 -->
            <img src="./images/cool-background (5).png" alt="">
            <div class="container">
                <div class="carousel-caption">
                    <h1>广告位</h1>
                    <h5>火车一响，黄金万两</h5>
                    <p><a class="btn btn-lg btn-primary" href="#">learn more</a></p>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="height: 220px;">
            <img src="./images/cool-background (2).png" alt="">

            <div class="container">
                <div class="carousel-caption text-end">
                    <h1>广告位</h1>
                    <h5>诚招广告，童叟无欺，诚信为本</h5>
                    <p><a class="btn btn-lg btn-primary" href="#">learn more</a></p>
                </div>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<!-- 轮播图结束 -->

<!-- 导航栏头部开始 -->
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">Online Chat-room</a>

    <div class="navbar-nav">
        <div class="nav-item text-nowrap">
            <button class="nav-link px-4 bg-white" style="border-radius: 5px;"><span>
                    style="color: black; font-size: 16px; font-family: 'fangsong';">退出登录</span></button>
        </div>
    </div>
</header>
<!-- 导航栏头部结束 -->


<!-- 主体部分开始 :显示在线人数，显示聊天信息，显示输入相关-->
<div class="container-fluid">
    <div class="row">
        <!-- 在线好友显示部分 -->
        <iframe id="showFriend" src="online.jsp"></iframe>

        <div style="height: 500px;" class="col-md-9 ms-sm-auto col-lg-10 ">
            <iframe src="message.jsp" class="my-4 w-100 h-100" style="border-radius: 12px; border: #333 solid 3px;"></iframe>

            <div class="massageIn" >
                <iframe src="input.jsp"></iframe>
            </div>
        </div>
    </div>
</div>




<!-- 底部开始 -->
<footer class="footer mt-auto py-3 bg-black">
    <div class="container">
      <span style="font-size: 20px; font-weight: 700; font-family: 'kaiti'; color: #fff;">Buyer
        Forum&nbsp;&nbsp;&nbsp;——&nbsp;&nbsp;为选择困难症设计的一站式平台</span>
        <span style="color: #fff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy;&nbsp;2022&nbsp;&nbsp; </span>
    </div>
</footer>





</body>
</html>

