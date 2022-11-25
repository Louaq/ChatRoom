package com.scuec.service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/quitLogin")
public class quitLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //销毁context域中的nameSession
        request.getServletContext().removeAttribute("nameSession");

        //返回值
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("success");
    }
}
