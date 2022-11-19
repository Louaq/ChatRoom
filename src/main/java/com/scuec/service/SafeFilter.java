package com.scuec.service;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;


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
        if (url.equals("http://localhost:8080/") || url.contains("/login.jsp") || url.contains("/login") || url.contains("/register.jsp") || url.contains("/Register") || url.contains("/SendSmsServlet") || url.contains("/images/") || url.contains("/css/") || url.contains("/js/") || url.contains("/jquery-3.5.1/")) {

            filterChain.doFilter(servletRequest, servletResponse);
        } else{
            //判断是否登录
            String user = (String) req.getServletContext().getAttribute("nameSession");

            if (user != null) {
                //放行
                filterChain.doFilter(servletRequest, servletResponse);


                //防止中文乱码
                servletResponse.setCharacterEncoding("utf-8");


            } else {
                //跳转到登录页面
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
