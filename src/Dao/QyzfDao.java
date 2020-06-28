package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Entity.Qyzf;
import Util.DBConnect;

public class QyzfDao extends DBConnect{
    
    
    public ArrayList<Qyzf> GetAllQyzf(){
        ArrayList<Qyzf> QyzfList = new ArrayList<Qyzf>();
        Connection conn = null;
        try {
            conn = super.getConnection();
            String sql = "SELECT * FROM qyzf";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            Qyzf qyzf = null;
            while(rs.next()){
            	qyzf = new Qyzf();
            	qyzf.setQy(rs.getString("qy"));
            	qyzf.setZfdata(rs.getString("zfdata"));               
            	QyzfList.add(qyzf);
            }
            return QyzfList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
    
   