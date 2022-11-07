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

<table border="1" width="70%">
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
        <td><%=shop.getId()%></td>
        <td><%=shop.getName()%></td>
        <td><%=shop.getPrice()%></td>
        <td><button onclick="addCart(<%=shop.getId()%>)">加入购物车</button></td>
    </tr>
    <%
        }
    %>
</table>

<%--结算按钮--%>
<button onclick="settle()">结算</button>

<script>
    //点击加入购物车按钮，将商品id传递给后台，后台将商品id存入session中，页面不发生跳转
    function addCart(id) {
        var xhr = new XMLHttpRequest();
        xhr.open("get","/ShopServlet?id="+id);
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











</body>
</html>
