<%@ page import="com.scuec.service.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.scuec.service.Shop" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="com.scuec.service.mapper.ShopMapper" %><%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/11/6
  Time: 16:36:
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
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
    </style>
</head>
<body>
<%--获取购物车--%>
<div class="b-example-divider">

</div>

<div class="modal modal-tour position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalTour">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-body p-5">
                <h2 class="fw-bold mb-0">你的物品</h2>
                <!-- 表格添加 -->
                <%
                    Cart cart = (Cart) session.getAttribute("cart");
                    if (cart == null) {
                        cart = new Cart();
                        session.setAttribute("cart", cart);
                    }

                    Map<Integer, Shop> car = new HashMap<Integer, Shop>();
                    car = cart.getCar();

                    if (car.size() == 0) {
                        out.println("购物车为空");
                    } else {
                        out.println("购物车中有" + car.size() + "件商品");
                        out.println("<table border='1'>");
                        out.println("<tr>");
                        out.println("<td>商品名称</td>");
                        out.println("<td>商品价格</td>");
                        out.println("<td>商品数量</td>");
                        out.println("<td>商品总价</td>");
                        out.println("</tr>");
                        for (Map.Entry<Integer, Shop> entry : car.entrySet()) {
                            out.println("<tr>");
                            out.println("<td>" + entry.getValue().getName() + "</td>");
                            out.println("<td>" + entry.getValue().getPrice() + "</td>");
                            out.println("<td>" + entry.getValue().getBuyNum() + "</td>");
                            out.println("<td>" + entry.getValue().getPrice() * entry.getValue().getBuyNum() + "</td>");
                            out.println("</tr>");
                        }
                        //计算总价
                        double total = 0;
                        for (Map.Entry<Integer, Shop> entry : car.entrySet()) {
                            total += entry.getValue().getPrice() * entry.getValue().getBuyNum();
                        }
                        out.println("<tr>");
                        out.println("<td colspan='4'>总价：" + total + "</td>");
                        out.println("</tr>");
                        out.println("</table>");

                        /*将商品信息写入数据库*/
                        String resource = "mybatis-config.xml";
                        InputStream inputStream = Resources.getResourceAsStream(resource);
                        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
                        SqlSession sqlSession = sqlSessionFactory.openSession();
                        ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
                        for (Map.Entry<Integer, Shop> entry : car.entrySet()) {
                            shopMapper.addShop(entry.getValue());
                        }
                        sqlSession.commit();
                        sqlSession.close();

                    }

                %>
                <%--订单编号--%>
                <%
                    String orderNum = "";
                    //随机生成订单编号
                    orderNum = String.valueOf(System.currentTimeMillis());
                    out.println("订单编号：" + orderNum);
                %>

            </div>
        </div>
    </div>
</div>

<div class="container">
    <footer class="py-3 my-4">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
        </ul>
        <p class="text-center text-muted">&copy; 2022 Company, Inc</p>
    </footer>
</div>

<script src="js/bootstrap.bundle.min.js"></script>

</body>
</html>
