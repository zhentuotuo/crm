package com.jykj.filter;

import com.jykj.pojo.Employ;
import com.jykj.util.Constants;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SysFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req1 = (HttpServletRequest) req;
        HttpServletResponse resp1 = (HttpServletResponse) resp;
        String attr = req1.getSession().getAttribute(Constants.USER_SESSION).toString();
        if (attr!=null){
            filterChain.doFilter(req,resp);
        }else {
            resp1.sendRedirect("/error.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
