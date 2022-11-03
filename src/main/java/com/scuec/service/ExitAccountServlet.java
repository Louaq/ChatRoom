package com.scuec.service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/ExitAccountServlet")
public class ExitAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //退出登录
        //获取用户的session
        HttpSession session = request.getSession();
        //销毁session
        session.invalidate();
        //跳转到登录页面
        response.sendRedirect(request.getContextPath()+"/login.jsp");

    }
}
