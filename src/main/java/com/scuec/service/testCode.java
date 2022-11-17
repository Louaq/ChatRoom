package com.scuec.service;

import com.zhenzi.sms.ZhenziSmsClient;
import java.util.HashMap;
import java.util.Map;

public class testCode{
    private String username;

    public testCode(String username) {
        this.username = username;
    }


    //发送验证码
    public String send() throws Exception {
        String apiUrl = "https://sms_developer.zhenzikj.com";
        String appId = "112591";
        String appSecret = "2af4ffbc-1cb2-4671-ae59-cfdccaaff97c";
        int code = (int) ((Math.random() * 9 + 1) * 100000);
        ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("number",username);
        params.put("templateId","10741");
        String[] templateParams = new String[2];
        templateParams[0]= String.valueOf(code);
        templateParams[1]="5分钟";
        params.put("templateParams",templateParams);
        String result = client.send(params);
        //输出结果
        System.out.println(result);
        return String.valueOf(code);
    }




}
