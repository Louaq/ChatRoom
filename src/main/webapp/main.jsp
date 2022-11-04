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
    </style>

</head>
<body>

<div>


    <iframe src="message.jsp" width="100%" height="50%"></iframe>

    <iframe src="input.jsp" width="100%" height="30%"></iframe>

    <iframe id="frame0" src="online.jsp" width="700px" height="100px" style="margin-left: 610px"></iframe>

</div>

</body>
</html>
