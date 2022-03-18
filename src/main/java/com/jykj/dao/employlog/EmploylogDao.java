package com.jykj.dao.employlog;
import com.jykj.pojo.Employlog;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface EmploylogDao {
    public List<Employlog> getAllEmpl(Connection conn) throws SQLException;
    public int add(Connection conn,Employlog employlog) throws SQLException;
    public int upda(Connection conn,Employlog employlog) throws SQLException;
}
