package com.jykj.dao.employ;

import com.jykj.dao.BaseDao;
import com.jykj.pojo.Employ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployDaoImpl implements EmployDao {
    /**
     * 查询员工信息
     *
     * @param
     * @return List
     * @throws SQLException
     */
    @Override
    public List<Employ> getAllEmpl(Connection conn) throws SQLException {
        PreparedStatement pst = null;
        List<Employ> list = new ArrayList<>();
        Employ employ = null;
        ResultSet rs = null;
        if (conn != null) {
            String sql = "select * from employ";
            rs = BaseDao.execute(conn, pst, sql);
            while (rs.next()) {
                employ = new Employ();
                employ.setId(rs.getInt("id"));
                employ.setEmplName(rs.getString("EmplName"));
                employ.setEmplPwd(rs.getString("EmplPwd"));
                employ.setEmplDepa(rs.getInt("EmplDepa"));
                employ.setEmplRegion(rs.getInt("EmplRegion"));
                employ.setEmplPost(rs.getInt("EmplPost"));
                list.add(employ);
            }
            BaseDao.closeResources(conn, pst, rs);
        }
        return list;
    }

    /**
     * 添加员工信息
     * @param conn
     * @param employ
     * @return
     * @throws SQLException
     */
    @Override
    public int add(Connection conn, Employ employ) throws SQLException {
        PreparedStatement pst = null;
        int rows = 0;
        if (conn != null) {
            String sql = "INSERT INTO employ(EmplName,EmplPwd,EmplDepa,EmplRegion,EmplPost)VALUES(?,?,?,?,?)";
            Object[] params={employ.getEmplName(),employ.getEmplPwd(),employ.getEmplDepa(),employ.getEmplRegion(),employ.getEmplPost()};
            rows = BaseDao.execute(conn, pst, sql, params);
            BaseDao.closeResources(null,pst,null);
        }
        return rows;
    }
    /***
     * 根据ID修改员工信息
     * @param conn
     * @param
     * @return
     * @throws SQLException
     */
    @Override
    public int upda(Connection conn, Employ employ) throws SQLException {
        PreparedStatement pst = null;
        int rows = 0;
        if (conn != null) {
            String sql = "UPDATE employ SET EmplName=?,EmplPwd=?,EmplDepa=?,EmplRegion=?,EmplPost=? WHERE id = ?";
            Object[] params={employ.getEmplName(),employ.getEmplPwd(),employ.getEmplDepa(),employ.getEmplRegion(),employ.getEmplPost(),employ.getId()};
            rows = BaseDao.execute(conn, pst, sql, params);
            BaseDao.closeResources(null,pst,null);
        }
        return rows;
    }
    /**
     * 根据ID删除员工信息
     * @param conn
     * @param id
     * @return
     * @throws SQLException
     */
    @Override
    public int dele(Connection conn, int id) throws SQLException {
        PreparedStatement pst = null;
        int rows = 0;
        if (conn != null) {
            String sql = "DELETE FROM employ WHERE id=?";
            Object[] params={id};
            rows = BaseDao.execute(conn, pst, sql, params);
            BaseDao.closeResources(null,pst,null);
        }
        return rows;
    }
    /**
     * 获取员工总数
     * @param conn
     * @return 整型
     * @throws SQLException
     */
    @Override
    public int getCount(Connection conn) throws SQLException {
        PreparedStatement pst=null;
        ResultSet rs=null;
        int count=0;
        if(conn!=null){
            String sql="SELECT COUNT(1) as count from employ";
            rs = BaseDao.execute(conn, pst, sql);
            if(rs.next()){
                count = rs.getInt("count");
            }
            BaseDao.closeResources(conn,pst,rs);
        }
        return count;
    }
    /**
     * 根据用户名密码查找登陆用户
     * @param conn
     * @param
     * @return 对象类型
     * @throws SQLException
     */
    @Override
    public Employ getLoginUser(Connection conn, String ename,String epwd) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        Employ employ = null;
        if (conn != null) {
            String sql = "select * from employ where EmplName=? AND EmplPwd=?";
            Object[] params = {ename,epwd};
            rs = BaseDao.execute(conn, pst, rs, sql, params);
            if (rs.next()) {
                employ = new Employ();
                employ.setId(rs.getInt("id"));
                employ.setEmplName(rs.getString("emplName"));
                employ.setEmplPwd(rs.getString("emplPwd"));
                employ.setEmplDepa(rs.getInt("emplDepa"));
                employ.setEmplRegion(rs.getInt("emplRegion"));
                employ.setEmplPost(rs.getInt("emplPost"));
            }
            BaseDao.closeResources(conn, pst, rs);
        }
        return employ;
    }
}
