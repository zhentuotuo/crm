package com.jykj.service.employ;

import com.jykj.pojo.Employ;
import net.sf.json.JSONArray;

public interface EmployService {
    public int loginInt(String userName,String passWord);
    public Employ loginEmploy(String userName,String passWord);
    public int getCount();
    public JSONArray getAllEmploy();
    public boolean add(Employ employ);
    public boolean dele(int id);
    public boolean upda(Employ employ);
}
