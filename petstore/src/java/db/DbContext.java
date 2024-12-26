/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author PHT
 */
public class DbContext {
    /**
     * Tạo kết nối giữa ứng dụng với db
     * @return: kết nối
     */
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        String url = "jdbc:sqlserver://localhost;databaseName=FishStore;user=sa;password=1;encrypt=true;trustServerCertificate=true";
        //String url = "jdbc:sqlserver://localhost;databaseName=Toyz;user=sa;password=1;";
        Connection con = null;
        //Loading a driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //Creating a connection
        con = DriverManager.getConnection(url);
        return con;
    }
}
