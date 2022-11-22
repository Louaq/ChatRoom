//发送验证码
$(".sendVerifyCode").on("click", function () {
    var data = {};
    data.username = $("#newUser").val();
    if (data.username === '') {
        alert("please input phone number");
        return;
    }

    /*
    *电信：133、149、153、173、177、180、181、189、191、193、199
    *移动：134、135、136、137、138、139、147、150、151、152、157、158、159、178、182、183、184、187、188、198
    *联通：130、131、132、145、155、156、166、171、175、176、185、186
    *广电：190,192,197
    * */

    /*校验手机号码的合法性*/
    var reg = /^1(3\d|4[5-9]|5[0-35-9]|6[2567]|7[0-8]|8\d|9[0-35-9])\d{8}$/;
    if (!reg.test(data.username)) {
        alert("please input correct phone number");
        return;
    }

    $.ajax({
        url: "http://localhost:8080/SendSmsServlet",
        async: true,
        type: "post",
        dataType: "text",
        data: data,
        success: function (data) {
            if (data === 'success') {
                return;
            }
        }
    });
})
//ajax提交数据
$(".sub-btn").on("click", function () {
    var data = {};
    data.username = $.trim($("input[name=username]").val());
    data.password = $.trim($("input[name=password]").val());
    data.Code = $.trim($("input[name=verifyCode]").val());
    if (data.username == '') {
        alert("please input phone number");
        return;
    }
    if (data.password == '') {
        alert("please input password");
        return;
    }
    if (data.Code == '') {
        alert("please input verify code");
        return;
    }
    $.ajax({
        url: "http://localhost:8080/Register",
        async: false,
        type: "post",
        dataType: "text",
        data: data,
        success: function (data) {
            if (data === 'success') {
                alert("register successfully");
                window.location.href = "http://localhost:8080/login.jsp";
            } else {
                alert("register failed");
            }

        }
    });
})

//验证码倒计时
$(function () {
    $(".sendVerifyCode").on("click", function () {
        var that = $(this);
        var seconds = 60;
        that.attr("disabled", true);
        that.html(seconds + 's');
        let promise = new Promise((resolve, reject) => {
            let setTimer = setInterval(
                () => {
                    seconds -= 1;
                    that.html(seconds + 's');
                    if (seconds <= 0) {
                        resolve(setTimer)
                    }
                }
                , 1000)
        })
        promise.then((setTimer) => {
            // console.info('清除');
            clearInterval(setTimer);
            that.attr("disabled", false);
        })

    })
});

//判断密码的强度
$(function(){
    //添加鼠标失去焦点事件
    $("#newPassword").blur(function(){
        //获取密码框的值
        var password = $("#newPassword").val();
        //判断密码的强度:

        const finalCheckPwd = /^(?![a-zA-Z]+$)(?![A-Z0-9]+$)(?![A-Z\W_]+$)(?![a-z0-9]+$)(?![a-z\W_]+$)(?![0-9\W_]+$)[a-zA-Z0-9\W_]{8,16}$/;
        if (finalCheckPwd.test(password)) {
            $("#passwordStrength").html("王者，不愧是你");
            $("#passwordStrength").css("color", "green");

        }
        else if (password.length >= 6 && password.length <= 16) {
            $("#passwordStrength").html("青铜，密码强度一般");
            $("#passwordStrength").css("color", "orange");
        }
        else {
            $("#passwordStrength").html("菜鸡，你的密码弱爆了");
            $("#passwordStrength").css("color", "red");
        }
    })
});

//判断两次密码是否一致
$(function(){
    $("#confirmPassword").blur(function(){
        var password = $("#newPassword").val();
        var password2 = $("#confirmPassword").val();
        if(password !== password2){
            $("#confirmPw").html("两次密码不一致");
            $("#confirmPw").css("color", "red");
        }
        else{
            $("#confirmPw").html("两次密码一致");
            $("#confirmPw").css("color", "green");
        }
    })
});














//判断手机号的合法性
$(function(){
    //添加鼠标失去焦点事件
    $("#newUser").blur(function(){
        //获取密码框的值
        var phone = $("#newUser").val();
        //判断密码的强度:
        const reg = /^1(3\d|4[5-9]|5[0-35-9]|6[2567]|7[0-8]|8\d|9[0-35-9])\d{8}$/;
        if (reg.test(phone)) {
            $("#checkNumber").html("手机号码合法");
            $("#checkNumber").css("color", "green");

        }
        else {
            $("#checkNumber").html("手机号码不合法");
            $("#checkNumber").css("color", "red");
        }
    })
});























