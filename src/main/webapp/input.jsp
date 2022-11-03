<%--
  Created by IntelliJ IDEA.
  User: YangYang
  Date: 2022/10/30
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>input</title>
    <style>
        div {
            margin-left: 600px;
        }
    </style>
</head>
<body>
<div>
    <form action="ChatServlet" method=post>
        <textarea cols="105" rows="5" name="input_textarea"></textarea><br>
        <input type="submit" value="发送" name="button_one"
               style="width: 100px; height: 40px;font-size: 25px;margin-top: 10px;margin-left:315px"><br>
    </form>


    <script>
        var button = document.getElementsByTagName("input")[1];
        button.onclick = function () {
            window.location.href = "onlineListener?method=contextDestroyed";
        }
    </script>

</div>

</body>
</html>
