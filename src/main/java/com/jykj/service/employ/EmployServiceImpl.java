package com.jykj.service.employ;

import com.jykj.dao.BaseDao;
import com.jykj.dao.employ.EmployDao;
import com.jykj.dao.employ.EmployDaoImpl;
import com.jykj.pojo.Employ;
import net.sf.json.JSONArray;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class EmployServiceImpl implements EmployService {
    private EmployDao employDao;

    public EmployServiceImpl() {
        employDao = new EmployDaoImpl();
    }

    @Override
    public JSONArray getAllEmploy() {
        Connection conn = null;
        JSONArray data = null;
        List<Employ> list = null;
        conn = BaseDao.getConnection();
        try {
            list = employDao.getAllEmpl(conn);
            data = JSONArray.fromObject(list);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            BaseDao.closeResources(conn, null, null);
        }
        return data;
    }

    @Override
    public boolean add(Employ employ) {
        boolean flag = false;
        Connection connection = BaseDao.getConnection();
        try {
            connection.setAutoCommit(false);
            int add = employDao.add(connection, employ);
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
    public boolean upda(Employ employ) {
        boolean flag = false;
        Connection connection = BaseDao.getConnection();
        try {
            connection.setAutoCommit(false);
            int upda = employDao.upda(connection, employ);
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

    @Override
    public boolean dele(int id) {
        boolean flag = false;
        Connection connection = BaseDao.getConnection();
        try {
            connection.setAutoCommit(false);
            int dele = employDao.dele(connection, id);
            connection.commit();
            if (dele > 0) {
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
    public int getCount() {
        Connection conn = null;
        int count = 0;
        conn = BaseDao.getConnection();
        try {
            count = employDao.getCount(conn);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            BaseDao.closeResources(conn, null, null);
        }
        return count;
    }

    @Override
    public int loginInt(String ename, String epwd) {
        Connection conn = null;
        Employ employ = null;
        conn = BaseDao.getConnection();
        try {
            employ = employDao.getLoginUser(conn, ename, epwd);
            if (employ!=null){
                if (ename.equals("admin") && epwd.equals("123456")) {
                    return 1;
                } else {
                    return 2;
                }
            }else {
                return 0;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            BaseDao.closeResources(conn, null, null);
        }
        return 0;
    }

    @Override
    public Employ loginEmploy(String userName, String passWord) {
        Connection conn = null;
        Employ employ = null;
        conn = BaseDao.getConnection();
        try {
            employ = employDao.getLoginUser(conn, userName, passWord);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            BaseDao.closeResources(conn, null, null);
        }
        return employ;
    }
}
