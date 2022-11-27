<%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/10/29
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>message</title>
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <style>
        #message{
            width: 100%;
            font-size: large;
            font-weight: bold;
            font-family: 'kaiti';

        }
    </style>
</head>
<body>
<%
    response.setIntHeader("Refresh", 1);
%>

<div>
    <textarea cols="" rows="40" name="show_textarea" id="message"><%=application.getAttribute("input_textarea")%></textarea>
</div>











</body>
</html>
