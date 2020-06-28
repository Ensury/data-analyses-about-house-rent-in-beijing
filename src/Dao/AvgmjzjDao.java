package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Entity.Avgmjzj;
import Util.DBConnect;

public class AvgmjzjDao extends DBConnect{
    
    
    public ArrayList<Avgmjzj> GetAllAvgmjzj(){
        ArrayList<Avgmjzj> AvgmjzjList = new ArrayList<Avgmjzj>();
        Connection conn = null;
        try {
            conn = super.getConnection();
            String sql = "SELECT * FROM avgmjzj";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            Avgmjzj avgmj = null;
            while(rs.next()){
            	avgmj = new Avgmjzj();
            	avgmj.setQy(rs.getString("qy"));
            	avgmj.setMjzjdata(rs.getString("mjzjdata"));               
            	AvgmjzjList.add(avgmj);
            }
            return AvgmjzjList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}