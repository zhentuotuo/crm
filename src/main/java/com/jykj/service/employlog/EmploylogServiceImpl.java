package com.jykj.service.employlog;
import com.jykj.dao.BaseDao;
import com.jykj.dao.employlog.EmploylogDao;
import com.jykj.dao.employlog.EmploylogDaoImpl;
import com.jykj.pojo.Employlog;
import net.sf.json.JSONArray;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class EmploylogServiceImpl implements EmploylogService {
    private EmploylogDao employlogDao;

    public EmploylogServiceImpl() { employlogDao = new EmploylogDaoImpl();}
    @Override
    public JSONArray getAllEmploylog() {
        Connection conn = null;
        JSONArray data = null;
        List<Employlog> list = null;
        conn = BaseDao.getConnection();
        try {
            list = employlogDao.getAllEmpl(conn);
            data = JSONArray.fromObject(list);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            BaseDao.closeResources(conn, null, null);
        }
        return data;
    }

    @Override
    public boolean add(Employlog employlog) {
        boolean flag = false;
        Connection connection = BaseDao.getConnection();
        try {
            connection.setAutoCommit(false);
            int add = employlogDao.add(connection, employlog);
            connection.commit();
            if (add > 0) {
                flag = true;
            } else {
                flag = false;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } finally {
            BaseDao.closeResources(connection, null, null);
        }
        return flag;
    }

    @Override
    public boolean upda(Employlog employlog) {
        boolean flag = false;
        Connection connection = BaseDao.getConnection();
        try {
            connection.setAutoCommit(false);
            int upda = employlogDao.upda(connection, employlog);
            connection.commit();
            if (upda > 0) {
                flag = true;
            } else {
                flag = false;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } finally {
            BaseDao.closeResources(connection, null, null);
        }
        return flag;
    }
}
