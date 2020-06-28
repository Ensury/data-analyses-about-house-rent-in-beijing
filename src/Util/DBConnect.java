package Util;


import java.sql.*;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;

public class DBConnect {
    private static final String driver = "com.mysql.jdbc.Driver"; //鏁版嵁搴撻┍鍔�
    //杩炴帴鏁版嵁搴撶殑URL鍦板潃
   // private static final String url = "jdbc:mysql://localhost:3306/library?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
    private static final String url = "jdbc:mysql://localhost:3306/zufang?useUnicode=true&characterEncoding=UTF-8";
    private static final String username = "root";//鏁版嵁搴撶殑鐢ㄦ埛鍚�
    private static final String password = "123456";//鏁版嵁搴撶殑瀵嗙爜

    private static Connection conn = null;

    //闈欐�佷唬鐮佸潡璐熻矗鍔犺浇椹卞姩
    static {
        try {
            Class.forName(driver);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //鍗曚緥妯″紡杩斿洖鏁版嵁搴撹繛鎺ュ璞�
    public static Connection getConnection() throws Exception {
        if (conn == null) {
            conn = DriverManager.getConnection(url, username, password);
            return conn;
        }
        return conn;
    }

    public static void close(Connection conn, Statement st, ResultSet rs) {
        try {
            if (conn != null)
                conn.close();
            if (st != null)
                st.close();
            if (rs != null)
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static boolean executeSql(String sql) {
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Statement st = null;
        try {
            st = conn.createStatement();
            return st.executeUpdate(sql) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, st, null);
        }
        return false;
    }

}