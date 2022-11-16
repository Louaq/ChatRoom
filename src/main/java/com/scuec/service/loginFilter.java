package com.scuec.service;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static java.lang.System.out;


@WebFilter("/login")
public class loginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //判断用户是否重复登录,如果重复登录,则不能登录
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        String user = (String) req.getServletContext().getAttribute("nameSession");
        if (user != null && user.equals(req.getParameter("username"))) {
            //存储错误信息，转发到登录页面
            req.setAttribute("msg", "您已经登录过了，无需重复登录");
            req.getRequestDispatcher("/login.jsp").forward(req, servletResponse);


        } else {
            //放行
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
