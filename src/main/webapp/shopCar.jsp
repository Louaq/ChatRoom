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
    <style>
        table {
            width:670px;
            height:42px;
            border-collapse: collapse;
            text-align: center;

        }
        tr {
            height: 50px;
            width: 150px;
        }
        td {
            width: 100px;
            height: 50px;
        }

    </style>
</head>
<body>
<%--展示商品区--%>
<%
    String resource = "mybatis-config.xml";
    InputStream inputStream = Resources.getResourceAsStream(resource);
    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    SqlSession sqlSession = sqlSessionFactory.openSession();
    ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
    List<Shop> shopList = shopMapper.selectShops();
    out.print("<div>");
    out.println("<form action='ShopServlet' method='POST'>");

    for (Shop shop : shopList) {
        //表格显示
        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<td name='id'>" + shop.getId() + "</td>");
        out.println("<td name='name'>" + shop.getName() + "</td>");
        out.println("<td name='price'>" + shop.getPrice() + "</td>");
        //添加购物车按钮
        out.println("<td><input type='submit' value='添加购物车' width='30px' height='20px'></td>");
        out.println("</tr>");
    }

    out.println("</form>");
    out.print("</div>");
    sqlSession.close();

%>
</body>
</html>
