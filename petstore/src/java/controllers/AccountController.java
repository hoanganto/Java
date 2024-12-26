/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import db.Account;
import db.AccountFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Alert;
import utils.Hash;

/**
 *
 * @author PHT
 */
@WebServlet(name = "AccountController", urlPatterns = {"/account"})
public class AccountController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String controller = request.getAttribute("controller").toString();
        String action = request.getAttribute("action").toString();
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
        }
    }
    
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Lấy tham chiếu của session
            HttpSession session = request.getSession();
            //Lấy thông tin từ client
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            //Kiểm tra thông tin
            AccountFacade af = new AccountFacade();
            Account account = af.login(email, Hash.hash(password));
            //Nếu login thành công
            if (account != null) {
                //Lưu account vào session
                session.setAttribute("account", account);  
                //Quay về home page
                response.sendRedirect(request.getContextPath());
            } else {
                Alert alert = new Alert("danger", "Login Error", "Please check your email or password");
                session.setAttribute("alert", alert);
                //Quay về home page & thông báo lỗi
                response.sendRedirect(request.getContextPath() + "?alert=1&login=1");
            }
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();//in chi tiết ngoại lệ
        }
    }
    
    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Lấy tham chiếu của session
            HttpSession session = request.getSession();
            //Xóa session
            session.invalidate();
            //Quay về home page
            response.sendRedirect(request.getContextPath());
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();//in chi tiết ngoại lệ
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
