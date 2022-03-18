package com.jykj.service.employdetails;

import com.jykj.pojo.EmployDetails;
import net.sf.json.JSONArray;
public interface EmployDetailsService {
    public JSONArray getAllEdetails(String uname);
    public boolean add(EmployDetails edetails);
}
