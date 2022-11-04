package com.scuec.service;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;


//配置拦截路径
@WebFilter("/*")
public class SafeFilter implements Filter {


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //防止中文乱码
        servletRequest.setCharacterEncoding("utf-8");
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        //判断访问资源的路径是否和登录注册相关
        String url = req.getRequestURL().toString();
        //如果是登录注册相关的资源，放行
        if (url.equals("http://localhost:8080/login.jsp") || url.equals("http://localhost:8080/login") || url.equals("http://localhost:8080/register.jsp") || url.equals("http://localhost:8080/Register") ||url.equals("http://localhost:8080/") || url.contains("/images/") || url.contains("/css/") || url.contains("/js/")) {

            filterChain.doFilter(servletRequest, servletResponse);

        } else{
            //判断是否登录
            HttpSession session = req.getSession();
            Object user = session.getAttribute("nameSession");
            System.out.println(user);

            if (user != null) {
                //放行
                filterChain.doFilter(servletRequest, servletResponse);


                //防止中文乱码
                servletResponse.setCharacterEncoding("utf-8");


            } else {
                //跳转到登录页面
                System.out.println("未登录");
                req.setAttribute("login_msg", "您尚未登录，请登录");
                req.getRequestDispatcher("/login.jsp").forward(servletRequest, servletResponse);
            }
        }

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {


    }

    @Override
    public void destroy() {


    }
}
