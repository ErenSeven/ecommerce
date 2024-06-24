/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import dao.OrdersDao;
import dao.UserDao;
import entity.Orders;
import entity.User;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@MultipartConfig(// ilk sorun buradan kaynakl�. Buras� olmad���nda 400 hata kodlar� al�n�yor
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(urlPatterns = "/OrdersOperationServlet")
public class OrdersOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // add order
            String op = request.getParameter("operation");

            if (op != null && op.trim().equals("addorder")) {
                // Add order
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                BigDecimal total_amount =  new BigDecimal(request.getParameter("total_amount"));
                String order_status = request.getParameter("order_status");
                String payment_method = request.getParameter("payment_method");

                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                User user = userDao.getUserById(user_id);

                Orders o = new Orders();
                o.setUser(user);
                o.setTotalAmount(total_amount);
                o.setOrderStatus(order_status);
                o.setPaymentMethod(payment_method);

                // order save...
                OrdersDao odao = new OrdersDao(FactoryProvider.getFactory());
                odao.saveOrders(o);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Order is added successfully..");
                response.sendRedirect("ordersCRUD.jsp");
                return;

            }
            else if (op != null && op.trim().equals("deleteorder")) {
                // Delete order
                int order_id = Integer.parseInt(request.getParameter("order_id"));

                OrdersDao ordersDao = new OrdersDao(FactoryProvider.getFactory());
                ordersDao.deleteOrdersById(order_id);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Order deleted successfully: " + order_id);
                response.sendRedirect("ordersCRUD.jsp");
                return;
            } else if (op != null && op.trim().equals("updateorder")) {
                // Update order

                
                int order_id = Integer.parseInt(request.getParameter("order_id"));
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                BigDecimal total_amount =  new BigDecimal(request.getParameter("total_amount"));
                String order_status = request.getParameter("order_status");
                String payment_method = request.getParameter("payment_method");
                
                // Get session factory
                SessionFactory factory = FactoryProvider.getFactory();

                // Get user by ID
                UserDao userDao = new UserDao(factory);
                User user = userDao.getUserById(user_id);

                // Get order by ID
                OrdersDao ordersDao = new OrdersDao(factory);
                Orders o = ordersDao.getOrdersById(order_id);

                if (o != null && user != null) {
                    // Begin transaction
                    Session session = factory.openSession();
                    Transaction tx = session.beginTransaction();
                    
                    o.setUser(user);
                    o.setTotalAmount(total_amount);
                    o.setOrderStatus(order_status);
                    o.setPaymentMethod(payment_method);

                    // Update order in database
                    ordersDao.updateOrders(o);

                    // Commit transaction
                    tx.commit();
                    session.close();

                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Order updated successfully: " + order_id);
                } else {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Order not found with ID: " + order_id);
                }
                response.sendRedirect("ordersCRUD.jsp");
                return;

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
