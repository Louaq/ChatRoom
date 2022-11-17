package com.scuec.service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/testServlet")
public class testServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取username
        String username = request.getParameter("username");
        testCode testCode = new testCode(username);
        String code = null;
        try {
            code = testCode.send();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        //将验证码存入session
        HttpSession session = request.getSession();
        session.setAttribute("code", code);


    }
}
