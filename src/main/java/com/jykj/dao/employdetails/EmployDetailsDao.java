package com.jykj.dao.employdetails;
import com.jykj.pojo.EmployDetails;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface EmployDetailsDao {
    public int add(Connection conn, EmployDetails edeta) throws SQLException;
    public List<EmployDetails> getAllDeta(Connection conn, String uname) throws SQLException;
}
