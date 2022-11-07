<%@ page import="com.scuec.service.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.scuec.service.Shop" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/11/6
  Time: 16:36:
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--获取购物车--%>
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
            out.println("<td>" + entry.getValue().getPrice()*entry.getValue().getBuyNum() + "</td>");
            out.println("</tr>");
        }
        //计算总价
        double total = 0;
        for (Map.Entry<Integer, Shop> entry : car.entrySet()) {
            total += entry.getValue().getPrice()*entry.getValue().getBuyNum();
        }
        out.println("<tr>");
        out.println("<td colspan='4'>总价：" + total + "</td>");
        out.println("</tr>");
        out.println("</table>");
    }






%>




</body>
</html>
