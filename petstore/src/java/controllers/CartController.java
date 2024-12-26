/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import cart.Cart;
import db.Account;
import db.Product;
import db.ProductFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Alert;

/**
 *
 * @author PHT
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

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
            case "index":
                index(request, response);
                break;
            case "add":
                add(request, response);
                break;
            case "empty":
                empty(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "checkout":
                checkout(request, response);
                break;
        }
    }

    protected void index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //cho hiện view /cart/index.jsp
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();//in chi tiết ngoại lệ
        }
    }

    protected void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Lấy cart trong session ra
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            //Nếu trong session chưa có cart thì tạo mới cart
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            int id = Integer.parseInt(request.getParameter("id"));
            cart.add(id, 1);
            //cho hiện view
            request.getRequestDispatcher("/product/index.do").forward(request, response);
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();//in chi tiết ngoại lệ
        }
    }

    protected void empty(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Lấy cart trong session ra
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            //Xóa sạch cart
            cart.empty();
            //option1: cho hiện view /cart/index.jsp
            //request.getRequestDispatcher("/cart/index.do").forward(request, response);
            //option2: cho hiện view /product/index.jsp
            request.getRequestDispatcher("/product/index.do").forward(request, response);
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();//in chi tiết ngoại lệ
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Lấy cart trong session ra
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            //Lấy thông tin từ client
            int id = Integer.parseInt(request.getParameter("id"));
            //Xóa item trong cart
            cart.remove(id);
            //Cho hiện view /cart/index.do
            request.getRequestDispatcher("/cart/index.do").forward(request, response);
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();//in chi tiết ngoại lệ
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Lấy cart trong session ra
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            //Lấy thông tin từ client
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            //Update cart
            cart.update(id, quantity);
            //Cho hiện view /cart/index.do
            request.getRequestDispatcher("/cart/index.do").forward(request, response);
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();//in chi tiết ngoại lệ
        }
    }

    protected void checkout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            Account account = (Account) session.getAttribute("account");
            //Neu customer chua login thi bat buoc phai login truoc khi checkout
            if (account == null) {
                //Lưu url hiện tại để quay trở lại sau khi login
                //session.setAttribute("oldUrl", "/cart/checkout.do");
                //Chuyen ve trang /cart/index.do va hien hop thoai login
                response.sendRedirect(request.getContextPath() + "/cart/index.do?login=1");
            } else {
                cart.checkout(account.getId());
                //Xoa cart
                cart.empty();
                //Quay ve trang chu & thong bao checkout thanh cong
                Alert alert = new Alert("success", "Checkout successfully", "Thank you for your order.");
                session.setAttribute("alert", alert);
                response.sendRedirect(request.getContextPath() + "?alert=1");
            }
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
