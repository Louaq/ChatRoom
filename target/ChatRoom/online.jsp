<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>online</title>
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <style>
        body {
            width: 100px;
            height: 40px;
        }
        div {
            width: 683px;
            height:280px;
            color: white;
        }
    </style>
</head>
<body>
<div>
    <%--1s刷新页面--%>
    <%
        response.setIntHeader("Refresh", 1);

    %>

    <%--<%
        System.out.println(application.getAttribute("allUser"));
        if(null != application.getAttribute("allUser")){
            List<String> list = (List<String>)application.getAttribute("allUser");
    %>
        在线人数:<span><%=list.size() %></span><br>
    <%
        for(String s:list){
    %>
    <a>姓名：</a><%=s %><a>---->此时在线</a><br>

    <%
            }
        }
    %>--%>

        当前在线人数为<%=application.getAttribute("peopleOnline")%>人
</div>
</body>
</html>
