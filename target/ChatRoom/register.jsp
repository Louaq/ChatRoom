<%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/10/27
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <style>

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

<div class="login">
    <div class="form">
        <form action="Register" method="POST">
            <input type="text" name="username" placeholder="username"> <br> <br>
            <input type="password" name="password" placeholder="password"> <br> <br>
            <input type="submit" value="注册">
        </form>
    </div>
</div>

</body>
</html>
