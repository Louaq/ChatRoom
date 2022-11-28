<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--使用jstl需要导相应的jar包--%>
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

    <%--显示infoList的大小--%>
<%--    <%
        List<String> infoList = (List<String>) request.getServletContext().getAttribute("infoList");
        if (infoList != null) {
            out.println("当前在线人数：" + infoList.size());

        }
    %>--%>
        <%
            if(null != application.getAttribute("User")){
                List<String> list = (List<String>)application.getAttribute("User");
        %>
        当前在线人数:<span><%=list.size() %>人</span><br>
        <%
            for(String s:list){
        %>
        <a>用户：</a><%=s %><a>在线</a><br>

        <%
                }
            }
        %>


</div>
</body>
</html>
