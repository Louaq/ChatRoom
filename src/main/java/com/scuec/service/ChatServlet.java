package com.scuec.service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 处理聊天信息的Servlet
 */

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
    // 用于存储聊天记录
    public String chat = "";

    public ChatServlet() {
        super();
    }

    public void destroy() {
        super.destroy();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //获取聊天的内容
        String input_textarea = request.getParameter("input_textarea");
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateFormat.format(now);
        //获取session的用户名
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");
        /*ServletContext servletContext = this.getServletContext();
        String name = (String) servletContext.getAttribute("nameSession");*/
        chat += name + " " + "在" + " " + time + " " + "说了：" + input_textarea + "\n";

        //获取application对象,将聊天内容放入application中
        ServletContext application = this.getServletContext();

        application.setAttribute("input_textarea", chat);
        request.getRequestDispatcher("input.jsp").forward(request, response);

    }
    //重写ArrayList的toString方法
    public String toString() {
        return chat;
    }

}
