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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>login</title>
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/signin.css">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>

<body class="text-center">
<%--提示尚未登录信息--%>
<%if (request.getAttribute("login_msg") != null) {%>
<script>
    alert("<%=request.getAttribute("login_msg")%>");
</script>
<%}%>


<main class="form-signin w-100 m-auto">
    <!-- 表单开始 -->
    <form action="login" method="POST">
        <img class="mb-4" src="images/logo.svg" alt="" width="80" height="85">
        <h1 class="h3 mb-3 fw-normal">请输入</h1>
        <div class="form-floating">
            <!-- 用户姓名输入框 -->
            <input type="text" class="form-control" id="Username" name="username" placeholder="username">
            <label for="Username">Username</label>
        </div>
        <div class="form-floating">
            <!-- 用户密码输入框 -->
            <input type="password" class="form-control" id="userPassword" name="password" placeholder="password">
            <label for="userPassword">Password</label>
        </div>

        <div class="checkbox mb-3">
            <label>
                <!-- 记住密码 -->
                <input type="checkbox" name="remember" value="true">&nbsp;记住密码
            </label>
            <br>
            <!-- 跳转界面 -->
            <a href="register.jsp">没有账号，点这里注册</a>
        </div>
        <!-- 提交按钮 -->
        <button class="w-100 btn btn-lg btn-primary" type="submit">登录</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2022–2023</p>
    </form>
    <!-- 表单结束 -->
</main>

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
