package com.jykj.dao.employ;

import com.jykj.pojo.Employ;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface EmployDao {
    public Employ getLoginUser(Connection conn,String ename,String epwd) throws SQLException;
    public int getCount(Connection conn) throws SQLException;
    public List<Employ> getAllEmpl(Connection conn) throws SQLException;
    public int add(Connection conn,Employ employ) throws SQLException;
    public int dele(Connection conn,int id) throws SQLException;
    public int upda(Connection conn,Employ employ) throws SQLException;
}
