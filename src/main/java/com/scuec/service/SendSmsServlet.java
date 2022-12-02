package com.scuec.service;

import com.alibaba.fastjson2.JSONObject;
import com.zhenzi.sms.ZhenziSmsClient;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 发送验证码
 */


public class SendSmsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String apiUrl = "https://sms_developer.zhenzikj.com";
    String appId = "112591";
    String appSecret = "2af4ffbc-1cb2-4671-ae59-cfdccaaff97c";
    String templateId = "10741";


    public SendSmsServlet() {



        super();

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("SendSmsServlet");
        this.doPost(request, response);

    }

    /**
     * 短信平台使用的是榛子云短信(smsow.zhenzikj.com)
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String username = request.getParameter("username");
            JSONObject json = null;

            //生成6位验证码
            String verifyCode = String.valueOf((int) ((Math.random() * 9 + 1) * 100000));

            ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("number", username);
            params.put("templateId", templateId);
            String[] templateParams = new String[2];
            templateParams[0] = verifyCode;
            templateParams[1] = "5分钟";
            params.put("templateParams", templateParams);

            String result = client.send(params);
            json = JSONObject.parseObject(result);
            if (json.getIntValue("code") != 0) {//发送短信失败
                renderData(response, "获取失败:" + json.getString("data"));
                return;
            }
            //将验证码存到session中,同时存入创建时间
            //创建上下文对象

            ServletContext context = this.getServletContext();


/*            HttpSession session = request.getSession();*/
            context.setAttribute("verifyCode", verifyCode);
            context.setAttribute("createTime", System.currentTimeMillis());
            renderData(response, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }



    }

    protected void renderData(HttpServletResponse response, String data){
        try {
            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(data);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
