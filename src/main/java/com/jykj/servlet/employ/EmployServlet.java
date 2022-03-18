package com.jykj.servlet.employ;

import com.jykj.pojo.Employ;
import com.jykj.service.employ.EmployServiceImpl;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EmployServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if(method!=null && method.equals("add")){
            this.add(req,resp);
        }else if(method!=null && method.equals("dele")) {
            this.dele(req,resp);
        }else if(method!=null && method.equals("upde")){
            this.upde(req,resp);
        }else{
            JSONArray data = new EmployServiceImpl().getAllEmploy();
            resp.getWriter().write(data.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ename=req.getParameter("ename");
        String epwd=req.getParameter("epwd");
        String edepa = req.getParameter("edepa");
        String eregi=req.getParameter("eregi");
        String epost=req.getParameter("epost");
        Employ employ = new Employ();
        employ.setEmplName(ename);
        employ.setEmplPwd(epwd);
        employ.setEmplDepa(Integer.parseInt(edepa));
        employ.setEmplRegion(Integer.parseInt(eregi));
        employ.setEmplPost(Integer.parseInt(epost));
        EmployServiceImpl employService = new EmployServiceImpl();
        if (employService.add(employ)){
            req.setAttribute("message","添加成功!");
            resp.sendRedirect("employ.jsp");
        }else {
            req.getRequestDispatcher("employ.jsp").forward(req,resp);
        }
    }
    private void upde(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("eid");
        String ename=req.getParameter("ename");
        String epwd=req.getParameter("epwd");
        String edepa = req.getParameter("edepa");
        String eregi=req.getParameter("eregi");
        String epost=req.getParameter("epost");
        Employ employ = new Employ();
        employ.setId(Integer.parseInt(id));
        employ.setEmplName(ename);
        employ.setEmplPwd(epwd);
        employ.setEmplDepa(Integer.parseInt(edepa));
        employ.setEmplRegion(Integer.parseInt(eregi));
        employ.setEmplPost(Integer.parseInt(epost));

        EmployServiceImpl employService = new EmployServiceImpl();
        if (employService.upda(employ)){
            resp.sendRedirect("employ.jsp");
        }else {
            req.getRequestDispatcher("employ.jsp").forward(req,resp);
        }
    }
    private void dele(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        EmployServiceImpl employService = new EmployServiceImpl();
        if (employService.dele(Integer.parseInt(id))){
            resp.sendRedirect("employ.jsp");
        }else {
            req.getRequestDispatcher("employ.jsp").forward(req,resp);
        }
    }
}
