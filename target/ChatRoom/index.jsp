<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/10/12
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <style>
        body {
            background: url(images/4.jpg) no-repeat center center fixed;
        }

        .login {
            width: 300px;
            height: 200px;
            margin: 0 auto;
            background-color: aqua;
            border-radius: 10px;
        }
        .form {
            margin: 20px auto;

        }
    </style>
</head>
<body>
<%--提示尚未登录信息--%>
<%if (request.getAttribute("login_msg") != null) {%>
<script>
    alert("<%=request.getAttribute("login_msg")%>");
</script>
<%}%>


<!--登录的表单-->
<div class="login">
    <div class="form">
        <form action="login" method="POST">
            <input type="text" name="username" placeholder="username"> <br> <br>
            <input type="password" name="password" placeholder="password"> <br> <br>
            <input type="submit" value="登录"> <input type="button" value="注册">
            <!--记住密码-->
            <input type="checkbox" name="remember" value="true">记住密码
        </form>
    </div>
</div>

<script>
    /*点击按钮，跳转*/
    $("input[type='button']").click(function () {
        window.location.href = "register.jsp";
    });

</script>

<%

    /*自动填充用户名和密码*/
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("username".equals(cookie.getName())) {
                out.println("<script>document.getElementsByName('username')[0].value='" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "'</script>");
            }
            if ("password".equals(cookie.getName())) {
                out.println("<script>document.getElementsByName('password')[0].value='" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "'</script>");
            }
        }
    }
%>
</body>
</html>
