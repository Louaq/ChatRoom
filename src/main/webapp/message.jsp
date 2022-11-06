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
</head>
<body>

<%
    response.setIntHeader("Refresh", 1);
%>
<%--刷新页面--%>


<div>
    <%=application.getAttribute("input_textarea")%>
</div>




</body>
</html>
