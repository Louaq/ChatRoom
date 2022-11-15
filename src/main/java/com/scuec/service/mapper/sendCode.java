package com.scuec.service.mapper;

import com.zhenzi.sms.ZhenziSmsClient;

import java.util.HashMap;
import java.util.Map;

public class sendCode {
    public static void main(String[] args) throws Exception {

        String apiUrl = "https://sms_developer.zhenzikj.com";
        String appId = "112591";
        String appSecret = "2af4ffbc-1cb2-4671-ae59-cfdccaaff97c";
        ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("number", "18386797248");
        params.put("templateId", "10741");
        String[] templateParams = new String[2];
        templateParams[0] = "3421";
        templateParams[1] = "5分钟";
        params.put("templateParams", templateParams);
        String result = client.send(params);
        System.out.println(result);

    }
}
