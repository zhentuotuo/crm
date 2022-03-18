package com.jykj.servlet.employ;
import com.jykj.service.employ.EmployServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import static com.jykj.util.Constants.USER_SESSION;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ename = req.getParameter("form-username");
        String epwd = req.getParameter("form-password");
        EmployServiceImpl employService = new EmployServiceImpl();
        int login = employService.loginInt(ename, epwd);
        int count = employService.getCount();
        req.getSession().setAttribute(USER_SESSION, employService.loginEmploy(ename, epwd).getEmplName());
        req.getSession().setAttribute("count", count);
        if (login != 0) {
            if (login == 1) {
                resp.sendRedirect("jsp/index.jsp");
            } else {
                resp.sendRedirect("jsp/indexd.jsp");
            }
        } else {
            req.setAttribute("error", "用户名或者密码错误!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
