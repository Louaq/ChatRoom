<%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/10/14
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>error</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">


</head>
<%--<body>

<h1>用户名和密码不匹配，请重新登陆!</h1>
<a href="login.jsp">重新登陆</a>

</body>--%>
<body class="d-flex flex-column h-100">

<main class="flex-shrink-0">
    <div class="container">
        <h1 class="mt-5">Login failed</h1><br>
        <h3>登录失败</h3><br>
        <p class="lead">请仔细检查你的用户名、密码或者验证码填写是否正确，确认无误后再次尝试登录。</p>
        <p><a href="login.jsp">点击此处</a> 返回登录界面</p>
    </div>
</main>
</body>

</html>
