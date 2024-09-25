package util;

import java.sql.*;

public class DBManager {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/jsp_project";
        String user = "root";
        String password = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        return conn;
    }


    // select를 수행한 후 리소스 해제를 위한 메서드
    // executeQuery ()

    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try{
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }


    //DML(insert, update, delete)을 수행한 후 리소스 해제를 위한 메서드
    //executeUpdate() - int
    public static void close(Connection conn, Statement stmt) {
        try{
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
