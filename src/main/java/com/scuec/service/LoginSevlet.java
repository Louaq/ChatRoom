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
import java.net.URLEncoder;


@WebServlet("/login")
public class LoginSevlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //防止乱码
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        //获取复选框数据
        String remember = request.getParameter("remember");

        //获取请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //用户名存储到session中
        request.getSession().setAttribute("nameSession",username);
        //设置session的有效时间
        request.getSession().setMaxInactiveInterval(60);


        //查询数据库的用户名和密码
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        User user = userMapper.selectUser(username, password);
        //判断用户名和密码是否正确
        if (user != null) {
            //登录成功
            //判断是否勾选了记住密码
            if ("true".equals(remember)) {
                //判断是否已经存在cookie
                Cookie[] cookies = request.getCookies();
                boolean flag = false;
                if (cookies != null && cookies.length > 0) {
                    for (Cookie cookie : cookies) {
                        String name = cookie.getName();
                        if ("username".equals(name)) {
                            flag = true;
                            break;
                        }
                    }
                }
                if (!flag) {
                    //创建cookie
                    //对用户名和密码进行编码，防止cookie中文乱码
                    username = URLEncoder.encode(username, "UTF-8");
                    password = URLEncoder.encode(password, "UTF-8");
                    //1.创建Cookie对象
                    Cookie c1 = new Cookie("username", username);
                    Cookie c2 = new Cookie("password", password);


                    //2.设置Cookie的存活时间
                    c1.setMaxAge(60 * 60 * 24 * 30);
                    c2.setMaxAge(60 * 60 * 24 * 30);

                    //3.发送Cookie
                    response.addCookie(c1);
                    response.addCookie(c2);

/*                  System.out.println(URLDecoder.decode(username, "UTF-8"));
                    System.out.println(URLDecoder.decode(password, "UTF-8"));*/
                }
            }
            //登录成功,转发到主聊天界面Select.jsp选择页面
            request.getRequestDispatcher("/Select.jsp").forward(request, response);

        } else {
            //登录失败,转发到error.jsp，重新登录
            request.getRequestDispatcher("/error.jsp").forward(request, response);

        }

    }
}

