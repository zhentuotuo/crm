package com.jykj.dao.employlog;
import com.jykj.dao.BaseDao;
import com.jykj.pojo.Employlog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmploylogDaoImpl implements EmploylogDao {
    /***
     * 查询日志
     * @param conn
     * @return
     * @throws SQLException
     */
    @Override
    public List<Employlog> getAllEmpl(Connection conn) throws SQLException {
        PreparedStatement pst = null;
        List<Employlog> list = new ArrayList<>();
        Employlog employlog = null;
        ResultSet rs = null;
        if (conn != null) {
            String sql = "select * from employlog";
            rs = BaseDao.execute(conn, pst, sql);
            while (rs.next()) {
                employlog = new Employlog();
                employlog.setTodaywork(rs.getString("todaywork"));
                employlog.setTomowork(rs.getString("tomowork"));
                employlog.setDatetimes(rs.getTimestamp("datetimes"));
                list.add(employlog);
            }
            BaseDao.closeResources(conn, pst, rs);
        }
        return list;
    }

    /***
     * 添加日志
     * @param conn
     * @param employlog
     * @return
     * @throws SQLException
     */
    @Override
    public int add(Connection conn, Employlog employlog) throws SQLException {
        PreparedStatement pst = null;
        int rows = 0;
        if (conn != null) {
            String sql = "INSERT INTO employlog(todaywork,tomowork,datetimes)VALUES(?,?,?)";
            Object[] params={employlog.getTodaywork(),employlog.getTomowork(),new Date()};
            rows = BaseDao.execute(conn, pst, sql, params);
            BaseDao.closeResources(null,pst,null);
        }
        return rows;
    }

    /***
     * 修改日志
     * @param conn
     * @param employlog
     * @return
     * @throws SQLException
     */
    @Override
    public int upda(Connection conn, Employlog employlog) throws SQLException {
        PreparedStatement pst = null;
        int rows = 0;
        if (conn != null) {
            String sql = "UPDATE employlog SET todaywork=?,tomowork=?,datetimes=? WHERE id = ?";
            Object[] params={employlog.getTodaywork(),employlog.getTomowork(),employlog.getDatetimes()};
            rows = BaseDao.execute(conn, pst, sql, params);
            BaseDao.closeResources(null,pst,null);
        }
        return rows;
    }
}
