package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Entity.Avgzj;
import Util.DBConnect;

public class AvgzjDao  extends DBConnect{
    
    
    public ArrayList<Avgzj> GetAllAvgzj(){
        ArrayList<Avgzj> AvgizList = new ArrayList<Avgzj>();
        Connection conn = null;
        try {
            conn = super.getConnection();
            String sql = "SELECT * FROM avgzj";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            Avgzj avgzf = null;
            while(rs.next()){
            	avgzf = new Avgzj();
            	avgzf.setQy(rs.getString("qy"));
            	avgzf.setPjzydata(rs.getString("pjzjdata"));               
            	AvgizList.add(avgzf);
            }
            return AvgizList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
    
