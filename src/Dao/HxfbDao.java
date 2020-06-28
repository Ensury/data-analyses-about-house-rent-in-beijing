package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Entity.Hxfb;
import Util.DBConnect;

public class HxfbDao extends DBConnect{
    
    
    public ArrayList<Hxfb> GetAllHxfb(){
        ArrayList<Hxfb> HxfbList = new ArrayList<Hxfb>();
        Connection conn = null;
        try {
            conn = super.getConnection();
            String sql = "SELECT * FROM hxfb";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            Hxfb hxfb = null;
            while(rs.next()){
            	hxfb = new Hxfb();
            	hxfb.setHx(rs.getString("hx"));
            	hxfb.setSl(rs.getString("sl"));               
            	HxfbList.add(hxfb);
            }
            return HxfbList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
    