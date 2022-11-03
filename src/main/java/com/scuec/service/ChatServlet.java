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
    public String chat_record = " ";  //定义聊天记录变量，此处为全局变量

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
        Date now = new Date();    //创建日期对象，及系统当前时间
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String time = dateFormat.format(now); //按照给定的日期格式获取系统当前时间


        String t = (String) request.getSession().getAttribute("nameSession");

        chat_record += time + "  " + t + "  " + "说了：" + input_textarea + "\n";   //聊天记录存储


        ServletContext application = this.getServletContext();  //获取application对象
        ArrayList<String> list = (ArrayList<String>) application.getAttribute("list");  //获取application中的list集合
        if (list == null) {  //判断list是否为空
            list = new ArrayList<String>();  //创建list集合
        }
        list.add(chat_record);  //将聊天记录存储到list集合中
        application.setAttribute("input_textarea", list);  //将list集合存储到application中
        request.getRequestDispatcher("input.jsp").forward(request, response);  //跳转到当前聊天输入界面，即界面布局不变




    }
}
