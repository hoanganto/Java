/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import controllers.Config;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PHT
 */
public class ProductFacade {
    public List<Product> select() throws ClassNotFoundException, SQLException, ParseException{
        List<Product> list = null;
        //Tạo kết nối
        Connection con = DbContext.getConnection();
        //Tạo đối tượng của interface Statement
        Statement stm = con.createStatement();
        //Thực lệnh SQL
        ResultSet rs = stm.executeQuery("select * from Product");
        //Xử lý kết quả
        list = new ArrayList<>();
        while(rs.next()){
            //đọc mẫu tin hiện hành vào object Product
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setDiscount(rs.getDouble("discount"));
            product.setCategoryId(rs.getInt("categoryId"));
            //thêm object Product vào list
            list.add(product);
        }
        //đóng kết nối db
        con.close();
        return list;
    } 
    
    public Product select(int id) throws ClassNotFoundException, SQLException, ParseException{
        Product product = null;
        //Tạo kết nối
        Connection con = DbContext.getConnection();
        //Tạo đối tượng của interface Statement
        PreparedStatement stm = con.prepareStatement("select * from Product where id=?");
        stm.setInt(1, id);
        //Thực lệnh SQL
        ResultSet rs = stm.executeQuery();
        //Xử lý kết quả
        if(rs.next()){
            //đọc mẫu tin hiện hành vào object Product
            product = new Product();
            product.setId(rs.getInt("id"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setDiscount(rs.getDouble("discount"));
            product.setCategoryId(rs.getInt("categoryId"));
        }
        //đóng kết nối db
        con.close();
        return product;
    } 
    
    public List<Product> select(int page, String sortField, String sortOrder) throws ClassNotFoundException, SQLException, ParseException{
        List<Product> list = null;
        //Tạo kết nối
        Connection con = DbContext.getConnection();
        //Tạo đối tượng của interface Statement
        Statement stm = con.createStatement();
        //tính m và n
        int m = Config.PAGE_SIZE;
        int n = (page - 1)*m;
        //Thực lệnh SQL
        String sql = String.format("select * from Product order by %s %s offset %d rows fetch next %d rows only", sortField, sortOrder, n, m);
        System.out.println(sql);
        ResultSet rs = stm.executeQuery(sql);
        //Xử lý kết quả
        list = new ArrayList<>();
        while(rs.next()){
            //đọc mẫu tin hiện hành vào object Product
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setDiscount(rs.getDouble("discount"));
            product.setCategoryId(rs.getInt("categoryId"));
            //thêm object Product vào list
            list.add(product);
        }
        //đóng kết nối db
        con.close();
        return list;
    } 
    
    public List<Product> select(int page, String searchField, String operator, String searchText, String sortField, String sortOrder) throws ClassNotFoundException, SQLException, ParseException{
        List<Product> list = null;
        //Tạo kết nối
        Connection con = DbContext.getConnection();
        //Tạo đối tượng của interface Statement
        Statement stm = con.createStatement();
        //tính m và n
        int m = Config.PAGE_SIZE;
        int n = (page - 1)*m;
        //Thực lệnh SQL
        String sql = String.format("select * from Product where %s %s '%s' order by %s %s offset %d rows fetch next %d rows only", searchField, operator, searchText, sortField, sortOrder, n, m);
        System.out.println(sql);
        ResultSet rs = stm.executeQuery(sql);
        //Xử lý kết quả
        list = new ArrayList<>();
        while(rs.next()){
            //đọc mẫu tin hiện hành vào object Product
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setDiscount(rs.getDouble("discount"));
            product.setCategoryId(rs.getInt("categoryId"));
            //thêm object Product vào list
            list.add(product);
        }
        //đóng kết nối db
        con.close();
        return list;
    } 
    
    public int getPageCount() throws ClassNotFoundException, SQLException, ParseException{
        int pageCount = 0;
        //Tạo kết nối
        Connection con = DbContext.getConnection();
        //Tạo đối tượng của interface Statement
        Statement stm = con.createStatement();
        //Thực lệnh SQL
        String sql = "select count(*) total_rows from Product";
        ResultSet rs = stm.executeQuery(sql);
        //Xử lý kết quả
        if(rs.next()){
            pageCount = (int)Math.ceil(rs.getInt("total_rows")/Config.PAGE_SIZE);            
        }
        //đóng kết nối db
        con.close();
        return pageCount;
    } 
    
    public int getPageCount(String searchField, String operator, String searchText) throws ClassNotFoundException, SQLException, ParseException{
        int pageCount = 0;
        //Tạo kết nối
        Connection con = DbContext.getConnection();
        //Tạo đối tượng của interface Statement
        Statement stm = con.createStatement();
        //Thực lệnh SQL
        String sql = String.format("select count(*) total_rows from Product where %s %s '%s'", searchField, operator, searchText);
        ResultSet rs = stm.executeQuery(sql);
        //Xử lý kết quả
        if(rs.next()){
            pageCount = (int)Math.ceil(rs.getInt("total_rows")/Config.PAGE_SIZE);            
        }
        //đóng kết nối db
        con.close();
        return pageCount;
    } 
}
