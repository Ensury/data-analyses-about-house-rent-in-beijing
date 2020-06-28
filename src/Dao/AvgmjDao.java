package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Entity.Avgmj;
import Util.DBConnect;

public class AvgmjDao extends DBConnect{
    
    
    public ArrayList<Avgmj> GetAllAvgmj(){
        ArrayList<Avgmj> AvgmjList = new ArrayList<Avgmj>();
        Connection conn = null;
        try {
            conn = super.getConnection();
            String sql = "SELECT * FROM avgmj";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            Avgmj avgmj = null;
            while(rs.next()){
            	avgmj = new Avgmj();
            	avgmj.setQy(rs.getString("qy"));
            	avgmj.setPjmjdata(rs.getString("pjmjdata"));               
            	AvgmjList.add(avgmj);
            }
            return AvgmjList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}