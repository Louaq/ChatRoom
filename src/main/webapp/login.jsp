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
    <title>登录</title>
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
        .yzm{
            height: 35px;
            margin: 0 auto;
            width: 100%;
            line-height: 35px;
            position: relative;
        }
        .yzm_input{
            position: absolute;
            left: 0;
            width: 180px;
            border-radius: 5px;
        }
        .yzm_pic{
            display: block;
            width: 40%;
            height: 40px;
            line-height: 40px;
            font-style: italic;
            background-color: black;
            border-radius: 5px;
            color: white;
            position: absolute;
            letter-spacing: 2pt;
            top: 0;
            left: 60%;
            border-right: 2px;
            text-align: center;
        }
        .picCover{
            background-color: black;
            width:20px;
            height:38px;
            position: absolute;
            top:1px;  right: 0;
            border-radius: 5px;
        }
    </style>
</head>

<body class="text-center">
<%--提示重复登录信息--%>
<%if (request.getAttribute("msg") != null) {%>
<script>
    alert("<%=request.getAttribute("msg")%>");
</script>
<%}%>

<%--提示 您尚未登录，请登录--%>
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
            <input type="text" class="form-control" id="Username" name="username" placeholder="username" onkeydown="KeyDown()">
            <label for="Username">手机号或用户名</label>
        </div>
        <div class="form-floating">
            <!-- 用户密码输入框 -->
            <input type="password" class="form-control" id="userPassword" name="password" placeholder="password" onkeydown="KeyDown()">
            <label for="userPassword">密码</label>
        </div>

        <!-- 验证码 -->
        <div class="checkbox mb-3 yzm">
            <input type="text" name="code" id="yzm_input" class="yzm_input" placeholder="请输入验证码">
            <textarea id="code" class="yzm_pic" title="看不清，换一张" name="myTextarea" style="resize: none;" readonly></textarea>
            <div class="picCover"></div>
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

<script>
    function KeyDown() {
        if (event.keyCode == 13) {
            document.forms[0].submit();
        }
    }
    // 验证码
    document.getElementById("code").onclick=changeImg;
    function changeImg(){
        var arrays = new Array(
            '1','2','3','4','5','6','7','8','9',
            'a','b','c','d','e','f','g','h','i','g','h','l',
            'm','n','o','p','q','r','s','t','u','v','w','x',
            'y','z',
            'A','B','C','D','E','F','G','H','I','J','K','L',
            'M','N','O','P','Q','R','S','T','U','V','W','X',
            'Y','Z'
        );//自定义创建一个验证库
        code="";
        // 随即从数据中获取四个验证码
        for(var i =0;i<4;i++){
            var r = parseInt(Math.random()*arrays.length);
            code+=arrays[r];
        }
        document.getElementById("code").innerHTML=code;
    }
    document.getElementById("code").click();
    // 验证
    // function check(){
    //   var error;
    //   // 获取验证码
    //   var codeInput = document.getElementById("yzm_input").value;
    //   if(codeInput.toLowerCase() == code.toLowerCase()){
    //     console.log("123");
    //     return true;
    //   }else{
    //     error = '验证码错误，请重新输入';
    //     document.getElementsById("errorTips");
    //     return false;
    //   }
    // }
</script>


<%--<script>
    document.body.style.filter = 'grayscale(1)';
</script>--%>













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
