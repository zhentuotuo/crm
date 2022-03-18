package com.jykj.servlet.employlog;
import com.jykj.pojo.Employlog;
import com.jykj.service.employ.EmployServiceImpl;
import com.jykj.service.employlog.EmploylogServiceImpl;
import net.sf.json.JSONArray;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


public class EmployLogServlet extends HttpServlet {
    EmploylogServiceImpl employlogService = new EmploylogServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String method = req.getParameter("method");
        if(method!=null && method.equals("add")){
            this.add(req,resp);
        }else if(method!=null && method.equals("sele")) {
            this.sele(req,resp);
        }else if(method!=null && method.equals("upde")){
            this.upde(req,resp);
        }else{
            JSONArray data = new EmployServiceImpl().getAllEmploy();
            resp.getWriter().write(data.toString());
        }
    }

    private void sele(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JSONArray data = employlogService.getAllEmploylog();
        if (data!=null){
            resp.getWriter().write(data.toString());
        }else {
            resp.sendRedirect("indexd.jsp");
        }
    }

    private void upde(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String today = req.getParameter("today");
        String tomo = req.getParameter("tomo");
        Employlog employlog = new Employlog();
        employlog.setTodaywork(today);
        employlog.setTomowork(tomo);
        employlog.setDatetimes(new Date());
        if (employlogService.add(employlog)){
            resp.sendRedirect("indexd.jsp");
        }else {
            resp.sendRedirect("indexd.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
