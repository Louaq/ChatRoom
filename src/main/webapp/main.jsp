<%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/10/27
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <style>
        body {
            background: url(images/4.jpg) no-repeat center center fixed;
        }

        div {
            height: 698px;
            width: 100%;
            margin: 0 auto;
        }
        #exitlogin {
            width: 100px;
            height: 30px;

        }
    </style>

</head>
<body>

<div>
    <%--点击按钮，销毁session对象，实现退出登录--%>

    <iframe src="message.jsp" width="100%" height="50%"></iframe>

    <iframe src="input.jsp" width="100%" height="30%"></iframe>

    <iframe id="frame0" src="online.jsp" width="700px" height="100px" style="margin-left: 610px"></iframe>

</div>

<div id="exitlogin">
    <form action="ExitAccountServlet" method="post" style="width:100px;margin-top: -25px">
        <input type="button" value="退出登录" style="width: 100px; height: 40px;font-size: 21px">
    </form>
</div>

</body>
</html>
