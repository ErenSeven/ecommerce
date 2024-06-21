package servlet;

import entity.User;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    @SuppressWarnings("deprecation")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");

                // validations
                if (userName.isEmpty()) {
                    out.println("Name is blank ");
                    return;
                }
                //creating user object to store data
                User user = new User(userName, userEmail, userPassword, "normal");
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();                
                int userId = (int) hibernateSession.save(user);                
                tx.commit();
                hibernateSession.close();                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Registration Successful !! User id is " + userId);                
                response.sendRedirect("login.jsp");
                return;
                
            } catch (Exception e) {
                e.printStackTrace();   
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
