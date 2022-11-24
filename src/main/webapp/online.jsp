<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>online</title>
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <style>
        div{
            font-weight: bold;
            text-align: center;
            font-size: large;
        }
    </style>
</head>
<body>
<div>
    <%--1s刷新页面--%>
    <%
        response.setIntHeader("Refresh", 1);

    %>
    在线人数：<%=application.getAttribute("count")%>人
</div>
</body>
</html>
