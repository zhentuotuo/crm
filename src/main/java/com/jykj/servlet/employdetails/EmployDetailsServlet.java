package com.jykj.servlet.employdetails;
import com.jykj.pojo.EmployDetails;
import com.jykj.service.employdetails.EmployDetailsServiceImpl;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.jykj.util.Constants.USER_SESSION;

public class EmployDetailsServlet extends HttpServlet {
    EmployDetailsServiceImpl employDetailsService = new EmployDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if(method!=null && method.equals("add")){
            this.add(req,resp);
        }else if(method!=null && method.equals("sele")){
            this.sele(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname=req.getParameter("uname");
        String phone=req.getParameter("phone");
        String educ = req.getParameter("educ");
        String mari = req.getParameter("mari");
        EmployDetails details = new EmployDetails();
        details.setUname(uname);
        details.setUphone(phone);
        details.setEduc(Integer.parseInt(educ));
        details.setMari(Integer.parseInt(mari));
        if (employDetailsService.add(details)){
            resp.sendRedirect("indexd.jsp");
        }else {
            resp.sendRedirect("indexd.jsp");
        }
    }

    protected void sele(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sname=req.getSession().getAttribute(USER_SESSION).toString();
        JSONArray data = employDetailsService.getAllEdetails(sname);
        if (data!=null){
            resp.getWriter().write(data.toString());
        }else {
            resp.sendRedirect("indexd.jsp");
        }
    }
}
