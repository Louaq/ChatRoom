/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.56
 * Generated at: 2022-11-02 06:03:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.URLDecoder;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.net.URLDecoder");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <title>login</title>\r\n");
      out.write("    <script src=\"jquery-3.5.1/jquery-3.5.1.js\"></script>\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"css/signin.css\">\r\n");
      out.write("    <style>\r\n");
      out.write("        html,\r\n");
      out.write("        body {\r\n");
      out.write("            height: 100%;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        body {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            padding-top: 40px;\r\n");
      out.write("            padding-bottom: 40px;\r\n");
      out.write("            background-color: #f5f5f5;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-signin {\r\n");
      out.write("            max-width: 330px;\r\n");
      out.write("            padding: 15px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-signin .form-floating:focus-within {\r\n");
      out.write("            z-index: 2;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-signin input[type=\"text\"] {\r\n");
      out.write("            margin-bottom: -1px;\r\n");
      out.write("            border-bottom-right-radius: 0;\r\n");
      out.write("            border-bottom-left-radius: 0;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-signin input[type=\"password\"] {\r\n");
      out.write("            margin-bottom: 10px;\r\n");
      out.write("            border-top-left-radius: 0;\r\n");
      out.write("            border-top-right-radius: 0;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"text-center\">\r\n");
      out.write('\r');
      out.write('\n');
if (request.getAttribute("login_msg") != null) {
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("    alert(\"");
      out.print(request.getAttribute("login_msg"));
      out.write("\");\r\n");
      out.write("</script>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<main class=\"form-signin w-100 m-auto\">\r\n");
      out.write("    <!-- 表单开始 -->\r\n");
      out.write("    <form action=\"login\" method=\"POST\">\r\n");
      out.write("        <img class=\"mb-4\" src=\"images/logo.svg\" alt=\"\" width=\"80\" height=\"85\">\r\n");
      out.write("        <h1 class=\"h3 mb-3 fw-normal\">请输入</h1>\r\n");
      out.write("        <div class=\"form-floating\">\r\n");
      out.write("            <!-- 用户姓名输入框 -->\r\n");
      out.write("            <input type=\"text\" class=\"form-control\" id=\"Username\" name=\"username\" placeholder=\"username\">\r\n");
      out.write("            <label for=\"Username\">Username</label>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-floating\">\r\n");
      out.write("            <!-- 用户密码输入框 -->\r\n");
      out.write("            <input type=\"password\" class=\"form-control\" id=\"userPassword\" name=\"password\" placeholder=\"password\">\r\n");
      out.write("            <label for=\"userPassword\">Password</label>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"checkbox mb-3\">\r\n");
      out.write("            <label>\r\n");
      out.write("                <!-- 记住密码 -->\r\n");
      out.write("                <input type=\"checkbox\" name=\"remember\" value=\"true\">&nbsp;记住密码\r\n");
      out.write("            </label>\r\n");
      out.write("            <br>\r\n");
      out.write("            <!-- 跳转界面 -->\r\n");
      out.write("            <a href=\"register.jsp\">没有账号，点这里注册</a>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- 提交按钮 -->\r\n");
      out.write("        <button class=\"w-100 btn btn-lg btn-primary\" type=\"submit\">登录</button>\r\n");
      out.write("        <p class=\"mt-5 mb-3 text-muted\">&copy; 2022–2023</p>\r\n");
      out.write("    </form>\r\n");
      out.write("    <!-- 表单结束 -->\r\n");
      out.write("</main>\r\n");
      out.write("\r\n");


    /*自动填充用户名和密码*/
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("username".equals(cookie.getName())) {
                out.println("<script>document.getElementsByName('username')[0].value='" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "'</script>");
            }
            if ("password".equals(cookie.getName())) {
                out.println("<script>document.getElementsByName('password')[0].value='" + URLDecoder.decode(cookie.getValue(), "UTF-8") + "'</script>");
            }
        }
    }

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
