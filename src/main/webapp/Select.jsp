<%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/11/1
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>select</title>
    <link rel="stylesheet" href="css/style.css" />
<%--    <style>
        body {
            background: url(images/4.jpg) no-repeat center center fixed;
        }
        div {
            width: 600px;
            height: 600px;
            position: absolute;
        }
    </style>--%>
</head>
<body>
<%--选择进入聊天室还是购物车--%>
<%--<div>
    <a href="main.jsp">进入聊天室主页面</a><br>
    <a href="shopCar.jsp">进入购物车</a>
</div>--%>

<div class="container">
    <div class="split left">
        <h1>讨论</h1>
        <a href="main.jsp" class="btn">Join Now</a>
    </div>
    <div class="split right">
        <h1>购物</h1>
        <a href="shopCar.jsp" class="btn">Buy Now</a>
    </div>
</div>

<script>
    const left = document.querySelector('.left')
    const right = document.querySelector('.right')
    const container = document.querySelector('.container')

    left.addEventListener('mouseenter', () => container.classList.add('hover-left'))
    left.addEventListener('mouseleave', () => container.classList.remove('hover-left'))

    right.addEventListener('mouseenter', () => container.classList.add('hover-right'))
    right.addEventListener('mouseleave', () => container.classList.remove('hover-right'))
</script>
</body>
</html>
