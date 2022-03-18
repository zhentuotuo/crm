package com.jykj.service.employlog;
import com.jykj.pojo.Employlog;
import net.sf.json.JSONArray;

public interface EmploylogService {
    public JSONArray getAllEmploylog();
    public boolean add(Employlog employlog);
    public boolean upda(Employlog employlog);
}
