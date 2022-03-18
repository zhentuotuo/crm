package com.jykj.service.employdetails;

import com.jykj.dao.BaseDao;
import com.jykj.dao.employdetails.EmployDetailsDao;
import com.jykj.dao.employdetails.EmployDetailsDaoImpl;
import com.jykj.pojo.Employ;
import com.jykj.pojo.EmployDetails;
import net.sf.json.JSONArray;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class EmployDetailsServiceImpl implements EmployDetailsService {
    private EmployDetailsDao edetailsDao;

    public EmployDetailsServiceImpl() {
        edetailsDao = new EmployDetailsDaoImpl();
    }

    @Override
    public JSONArray getAllEdetails(String uname) {
        Connection conn = null;
        JSONArray data = null;
        List<EmployDetails> details = null;
        conn = BaseDao.getConnection();
        try {
            details = edetailsDao.getAllDeta(conn, uname);
            data = JSONArray.fromObject(details);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            BaseDao.closeResources(conn, null, null);
        }
        return data;
    }

    @Override
    public boolean add(EmployDetails edetails) {
        boolean flag = false;
        Connection connection = BaseDao.getConnection();
        try {
            connection.setAutoCommit(false);
            int add = edetailsDao.add(connection, edetails);
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

}
