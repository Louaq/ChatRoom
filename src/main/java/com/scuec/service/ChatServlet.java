package com.scuec.service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
    public String record = " ";

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
        String input_textarea = request.getParameter("input_textarea");
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateFormat.format(now);
        //获取名字，名字存在ServletContext中
        ServletContext servletContext = this.getServletContext();
        String t = (String) servletContext.getAttribute("nameSession");
        record += time + "  " + t + "  " + "说了：" + input_textarea + "\n";

        ServletContext application = this.getServletContext();  //获取application对象
        ArrayList<String> list = (ArrayList<String>) application.getAttribute("list");
        if (list == null) {
            list = new ArrayList<String>();
        }
        list.add(record);
        application.setAttribute("input_textarea", list);
        request.getRequestDispatcher("input.jsp").forward(request, response);

    }
}
