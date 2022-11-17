package com.scuec.service;

import com.scuec.service.mapper.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //防止乱码
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        //获取请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //获取输入框的验证码
        String Code = request.getParameter("Code");
        //获取session中的验证码
        String verifyCode = (String) request.getSession().getAttribute("verifyCode");

        //判断验证码是否正确
        if (Code.equalsIgnoreCase(verifyCode)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            //响应结果
            this.renderData(response, "success");

            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            String type = "user";
            user.setType(type);

            //将用户信息存入数据库
            String resource = "mybatis-config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            SqlSession sqlSession = sqlSessionFactory.openSession();
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            int i = userMapper.insertUser(user);
            //提交事务
            sqlSession.commit();
            sqlSession.close();
            //返回登录页面
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("msg", "验证码错误");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

    }

    //作用：防止表单重复提交
    protected void renderData(HttpServletResponse response, String data) {
        try {
            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(data);
        } catch (Exception var4) {
            var4.printStackTrace();
        }

    }

}
