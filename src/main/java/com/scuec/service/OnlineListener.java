package com.scuec.service;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.List;

/**
 * 监听在线人数
 */

@WebServlet("/onlineListener")
public class OnlineListener implements ServletContextListener, HttpSessionAttributeListener, HttpSessionListener {
    ServletContext application = null;

    public void contextDestroyed(ServletContextEvent event) {


    }

    public void contextInitialized(ServletContextEvent event) {
        //用来存储在线用户的集合
        List<String> list = new ArrayList<String>();
        //用来保存所有已登录的用户
        application = event.getServletContext();
        //取得application对象
        application.setAttribute("User", list);
        //将集合设置到application范围属性中去

    }


    public void attributeAdded(HttpSessionBindingEvent se) {
        List<String> list = (List<String>) application.getAttribute("User");
        //假设：用户登陆成功之后，只将户名设置到session中
        String userName = (String) se.getValue();
        //取得用户名
        if (list.indexOf(userName) == -1) {
            //表示此用户之前没有登陆
            list.add(userName);
            application.setAttribute("User", list);
        }
    }

    public void attributeRemoved(HttpSessionBindingEvent se) {
        List<String> list = (List<String>) application.getAttribute("User");
        list.remove((String) se.getValue());
        application.setAttribute("User", list);
    }

    public void attributeReplaced(HttpSessionBindingEvent se) {

    }

    public void sessionCreated(HttpSessionEvent event) {
        //人数加一
/*        Integer count = (Integer) application.getAttribute("count");
        if (count == null) {
            count = 1;
        } else {
            count++;
        }
        application.setAttribute("count", count);*/


    }

    public void sessionDestroyed(HttpSessionEvent event) {
        //人数减一
/*        Integer count = (Integer) application.getAttribute("count");
        if (count == null) {
            count = 0;
        } else {
            count--;
        }
        application.setAttribute("count", count);*/

    }
}




