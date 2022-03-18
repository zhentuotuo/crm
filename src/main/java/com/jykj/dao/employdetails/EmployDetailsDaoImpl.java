package com.jykj.dao.employdetails;

import com.jykj.dao.BaseDao;
import com.jykj.pojo.EmployDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployDetailsDaoImpl implements EmployDetailsDao {
    /**
     * 添加员工基本信息
     * @param conn
     * @param edeta
     * @return
     * @throws SQLException
     */
    @Override
    public int add(Connection conn, EmployDetails edeta) throws SQLException {
        PreparedStatement pst = null;
        int rows = 0;
        if (conn != null) {
            String sql = "INSERT INTO employdetails(uname,uphone,educ,mari)VALUES(?,?,?,?)";
            Object[] params={edeta.getUname(),edeta.getUphone(),edeta.getEduc(),edeta.getMari()};
            rows = BaseDao.execute(conn, pst, sql, params);
            BaseDao.closeResources(null,pst,null);
        }
        return rows;
    }

    /**
     * 获取员工基本信息
     * @param conn
     * @return
     * @throws SQLException
     */
    @Override
    public List<EmployDetails> getAllDeta(Connection conn, String uname) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<EmployDetails> list = new ArrayList<>();
        EmployDetails edeta = null;
        if (conn != null) {
            String sql = "select * from employdetails where uname=?";
            Object[] params={uname};
            rs = BaseDao.execute(conn, pst, rs, sql, params);
            while (rs.next()) {
                edeta = new EmployDetails();
                edeta.setUname(rs.getString("uname"));
                edeta.setUphone(rs.getString("uphone"));
                edeta.setEduc(rs.getInt("educ"));
                edeta.setMari(rs.getInt("mari"));
                list.add(edeta);
            }
            BaseDao.closeResources(conn, pst, rs);
        }
        return list;
    }
}
