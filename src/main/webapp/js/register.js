//发送验证码
$(".sendVerifyCode").on("click", function () {
    var data = {};
    data.username = $("#newUser").val();
    if (data.username === '') {
        alert("请输入手机号码");
        return;
    }

    /*
    * 电信：133、149、153、173、177、180、181、189、191、193、199
    *移动：134、135、136、137、138、139、147、150、151、152、157、158、159、178、182、183、184、187、188、198
    *联通：130、131、132、145、155、156、166、171、175、176、185、186
    *广电：190,192,197
    * */

    /*校验手机号码的合法性*/
    var reg = /^1(3\d|4[5-9]|5[0-35-9]|6[2567]|7[0-8]|8\d|9[0-35-9])\d{8}$/;
    if (!reg.test(data.username)) {
        alert("请输入正确的手机号码");
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
    var result;
    data.username = $.trim($("input[name=username]").val());
    data.password = $.trim($("input[name=password]").val());
    data.Code = $.trim($("input[name=verifyCode]").val());
    if (data.username == '') {
        alert("请输入手机号码");
        return;
    }
    if (data.password == '') {
        alert("请输入密码");
        return;
    }
    if (data.Code == '') {
        alert("请输入验证码");
        return;
    }
    $.ajax({
        url: "http://localhost:8080/Register",
        async: true,
        type: "post",
        dataType: "text",
        data: data,
        success: function (data) {
            window.location.href = "http://localhost:8080/login.jsp";

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

























