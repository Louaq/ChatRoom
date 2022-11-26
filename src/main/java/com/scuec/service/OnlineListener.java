package com.scuec.service;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;





@WebServlet("/onlineListener")

//监听登录的用户，统计在线人数
public class OnlineListener implements ServletContextListener,
        HttpSessionListener {

    //监听Application对象
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        int count=0;
        //获取Application对象
        ServletContext sc = sce.getServletContext();
        sc.setAttribute("count",count);
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    //监听Session对象
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("sessionCreated");
        HttpSession session = se.getSession();
        ServletContext sc = session.getServletContext();
        int count = (int) sc.getAttribute("count");
        count++;
        sc.setAttribute("count",count);


    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("sessionDestroyed");
        HttpSession session = se.getSession();
        ServletContext sc = session.getServletContext();
        int count = (int) sc.getAttribute("count");
        count--;
        sc.setAttribute("count",count);
    }

}






