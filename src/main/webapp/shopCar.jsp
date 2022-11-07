<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.scuec.service.mapper.ShopMapper" %>
<%@ page import="com.scuec.service.Shop" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/11/1
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/pricing/">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
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

        body {
            background-image: linear-gradient(180deg, #eee, #fff 100px, #fff);
        }

        .container {
            max-width: 960px;
        }

        .pricing-header {
            max-width: 700px;
        }

        .shopShow {
            width: 100%;
            height: 800px;
            background-color: aqua;
        }

        /* 购物车部分 */

        .carBox {
            width: 100px;
            height: 40px;

        }

        .shopCar {
            width: 200px;
            height: 300px;
            background-color: chartreuse;
            position: absolute;
            top: 40px;
            left: -45px;
            display: none;
        }

        .carBox:hover .shopCar {
            display: block;
        }

        /* 列表样式开始 */
        .showShop {
            width: 100%;
            height: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .showShop tr {
            border-bottom: 1px solid black;
        }

        .showShop td,
        .showShop th {
            width: 90px;
            height: 90px;
            border-left: 1px solid black;
        }

        .shopBox {
            border: 2px solid black;
            border-radius: 10px;
        }

        .aStyle {
            text-decoration: none;
        }

        /* 商品按钮 */
        .shopButton {
            background-color: aliceblue;
            border: 2px solid black;
            border-radius: 5px;
            font-family: '仿宋';
            font-weight: 700;
        }

        .shopButton:hover {
            background-color: darkgray;
        }
    </style>
</head>
<body>
<div class="container py-3">
    <header>
        <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center text-dark text-decoration-none">
                <!-- 商品名称部分 -->
                <span class="fs-4" style="margin-left: 5px;">Buyer Forum</span>
            </a>

            <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto" style="position: relative;">
                <!-- 购物车部分 -->
                <div class="carBox">
                    <a class="py-2 text-dark text-decoration-none ifShow" href="#">购物车</a>
                    <div class="shopCar"></div>
                </div>
            </nav>
        </div>

        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal">Buyer</h1>
            <p class="fs-5 text-muted">诚信第一，生意第二<br>一个更加全面的、多方位的、自由的选购平台<br>
                本平台长期招收信用卖家入驻
            </p>
        </div>
    </header>


    <div class="shopBox">
        <table class="showShop">
            <tr>
                <th>编号</th>
                <th>名称</th>
                <th>价格</th>
                <th>操作</th>
            </tr>

            <%
                String resource = "mybatis-config.xml";
                InputStream inputStream = Resources.getResourceAsStream(resource);
                SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
                SqlSession sqlSession = sqlSessionFactory.openSession();
                ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
                List<Shop> shopList = shopMapper.selectShops();
                for (Shop shop : shopList) {
            %>
            <tr>
                <td><%=shop.getId()%>
                </td>
                <td><%=shop.getName()%>
                </td>
                <td><%=shop.getPrice()%>
                </td>
                <td>
                    <button onclick="addCart(<%=shop.getId()%>)">加入购物车</button>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <%--结算按钮--%>
    <div id="app" style="margin-left: 782px;margin-top: 10px">
        <el-button @click="visible = true" onclick="settle()">结算</el-button>
        <el-dialog :visible.sync="visible" title="Hello world">
            <p>Try Element</p>
        </el-dialog>
    </div>


    <h2 class="display-6 text-center mb-4">货比三家</h2>
    <div class="table-responsive">
        <table class="table text-center">
            <thead>
            <tr>
                <th style="width: 34%;"></th>
                <th style="width: 22%;">质量</th>
                <th style="width: 22%;">价格</th>
                <th style="width: 22%;">售后</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row" class="text-start">Buyer Forum</th>
                <td>极佳</td>
                <td>实惠</td>
                <td>好</td>
            </tr>
            <tr>
                <th scope="row" class="text-start">姘夕夕</th>
                <td>懂得都懂</td>
                <td>有得一拼</td>
                <td>懂得都懂</td>
            </tr>
            </tbody>

            <tbody>
            <tr>
                <th scope="row" class="text-start">某宝</th>
                <td>大多还行</td>
                <td>略高</td>
                <td>还行</td>
            </tr>
            <tr>
                <th scope="row" class="text-start">某东</th>
                <td>还行</td>
                <td>还行</td>
                <td>还行</td>
            </tr>
            </tbody>
        </table>
        <p style="text-align:right;font-size: 15px;">*纯属节目效果，切勿当真</p>
    </div>


    <footer class="pt-4 my-md-5 pt-md-5 border-top">
        <p style="text-align: center;">&copy;Designed and developed by<a href="https://github.com/ABF7470"
                                                                         class=" aStyle">&nbsp;Yangyang&nbsp;</a>and<a
                href="https://github.com/Qddl925"
                class=" aStyle">&nbsp;Tuo Xiaodong&nbsp;</a>.</p>
    </footer>
</div>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue@2/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>

<script>
    //点击加入购物车按钮，将商品id传递给后台，后台将商品id存入session中，页面不发生跳转
    function addCart(id) {
        var xhr = new XMLHttpRequest();
        xhr.open("get", "/ShopServlet?id=" + id);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                alert("加入购物车成功");
            }

        }

    }

    //点击结算按钮，跳转到doShopping.jsp页面，后台将session中的商品id取出，进行结算
    function settle() {
        window.location.href = "/doShopping.jsp";
    }

</script>
<script>
    new Vue({
        el: '#app',
        data: function() {
            return { visible: false }
        }
    })
</script>
</body>
</html>
