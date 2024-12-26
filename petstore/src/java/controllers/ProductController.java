/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

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

/**
 *
 * @author PHT
 */
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

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
                //xử lý action index để hiện home page
                index(request, response);
                break;
        }
        //request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
    }

    protected void index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String searchField = null;
            String operator = null;
            String searchText = null;
            
            String sortField = null;
            String sortOrder = null;

            int page = 1;
            String sPage = request.getParameter("page");
            if (sPage != null) {
                session.setAttribute("page", Integer.parseInt(sPage));
            }
            Object objPage = session.getAttribute("page");
            if (objPage != null) {
                page = (Integer) objPage;
            }

            String op = request.getParameter("op");
            if (op != null) {
                switch (op) {
                    case "search":
                        searchField = request.getParameter("searchField");
                        operator = request.getParameter("operator");
                        searchText = request.getParameter("searchText");
                        session.setAttribute("searchField", searchField);
                        session.setAttribute("operator", operator);
                        session.setAttribute("searchText", searchText);
                        break;
                    case "searchClear":
                        session.removeAttribute("searchField");
                        session.removeAttribute("operator");
                        session.removeAttribute("searchText");
                        break;
                    case "sort":
                        sortField = request.getParameter("sortField");
                        sortOrder = request.getParameter("sortOrder");
                        session.setAttribute("sortField", sortField);
                        session.setAttribute("sortOrder", sortOrder);
                        break;
                }
            }

            searchField = (String) session.getAttribute("searchField");
            operator = (String) session.getAttribute("operator");
            searchText = (String) session.getAttribute("searchText");
            
            sortField = (String) session.getAttribute("sortField");
            sortOrder = (String) session.getAttribute("sortOrder");
            if(sortField == null){
                sortField = "Id";
                sortOrder = "asc";
                session.setAttribute("sortField", sortField);
                session.setAttribute("sortOrder", sortOrder);
            }

            ProductFacade pf = new ProductFacade();
            int pageCount = 0;
            List<Product> list = null;
            if (searchField == null) {
                pageCount = pf.getPageCount();
                list = pf.select(page, sortField, sortOrder);
            } else {
                if (operator.equals("contains")) {
                    operator = "like";
                    searchText = String.format("%%%s%%", searchText);
                    System.out.println("searchText: " + searchText);
                }
                pageCount = pf.getPageCount(searchField, operator, searchText);
                list = pf.select(page, searchField, operator, searchText, sortField, sortOrder);
            }
            //lưu list vào request để truyền list cho view
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("list", list);
            //cho hiện view
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
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
