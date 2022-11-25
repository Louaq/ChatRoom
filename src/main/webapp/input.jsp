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
    <script src="jquery-3.5.1/jquery-3.5.1.js"></script>
    <style>
        #input_Text{
            width: 100%;
            font-size: large;
            font-weight: bold;
        }
        #sub_button{
            margin-left:46%;
            width: 100px;
            height: 40px;
            font-size: 25px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div>
    <textarea cols="" rows="2" name="input_textarea" id="input_Text"></textarea><br>
    <input type="submit" value="发送" name="button_one" id="sub_button"><br>
</div>

<script src="js/input.js"></script>
<%--<script>--%>
<%--&lt;%&ndash;  点击按钮清空输入框输入  &ndash;%&gt;--%>
<%--   var text = document.getElementById("input_textarea");--%>
<%--   document.getElementById("sub_button").onclick = function refresh(){--%>
<%--       text.innerHTML=""--%>
<%--   };--%>
<%--</script>--%>

</body>
</html>
