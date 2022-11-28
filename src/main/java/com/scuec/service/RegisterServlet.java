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

/**
 * 注册功能，可以防止用户重复注册
 */


@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

    public RegisterServlet() {
        super();
    }

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


        //注册之前先判断用户名是否存在，防止重复注册
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User newUser = userMapper.selectUserByName(username);
        if (newUser != null) {
            request.setAttribute("register_msg", "用户名已存在");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }


        //判断验证码是否正确和用户名是否存在
        if (Code.equalsIgnoreCase(verifyCode)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            String type = "user";
            user.setType(type);
            String resource2 = "mybatis-config.xml";
            InputStream inputStream2 = Resources.getResourceAsStream(resource2);
            SqlSessionFactory sqlSessionFactory2 = new SqlSessionFactoryBuilder().build(inputStream2);
            SqlSession sqlSession2 = sqlSessionFactory2.openSession();
            UserMapper userMapper2 = sqlSession2.getMapper(UserMapper.class);
            int i = userMapper2.insertUser(user);

            //提交事务
            sqlSession2.commit();
            //释放资源
            sqlSession2.close();

            //给ajax返回数据success
            response.getWriter().write("success");
        } else {
            //给ajax返回数据error
            response.getWriter().write("error");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }


    }


}
