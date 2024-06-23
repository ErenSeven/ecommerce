package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import dao.UserDao;
import entity.User;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/UserOperationServlet")
public class UserOperationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("operation");

            if (op.equals("adduser")) {
                // Add user
                String userName = request.getParameter("userName");
                String userEmail = request.getParameter("userEmail");
                String userPassword = request.getParameter("userPassword");
                String userType = request.getParameter("userType");

                User user = new User(userName, userEmail, userPassword, userType);

                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                int userId = userDao.addUser(user);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "User added successfully: " + userId);
                response.sendRedirect("userCRUD.jsp");
                return;

            } else if (op != null && op.equals("deleteuser")) {
                // Delete user
                int userId = Integer.parseInt(request.getParameter("userId"));

                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                userDao.deleteUser(userId);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "User deleted successfully: " + userId);
                response.sendRedirect("userCRUD.jsp");
                return;

            } else if (op != null && op.equals("updateuser")) {
                // Update user
                int userId = Integer.parseInt(request.getParameter("userId"));
                String userName = request.getParameter("userName");
                String userEmail = request.getParameter("userEmail");
                String userPassword = request.getParameter("userPassword");
                String userType = request.getParameter("userType");

                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                User user = userDao.getUserById(userId);

                if (user != null) {
                    user.setUserName(userName);
                    user.setUserEmail(userEmail);
                    user.setUserPassword(userPassword);
                    user.setUserType(userType);
                    userDao.updateUser(user);

                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "User updated successfully: " + userId);
                } else {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "User not found with ID: " + userId);
                }
                response.sendRedirect("userCRUD.jsp");
                return;
            }
        }
    }

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
        return "User operation servlet";
    }
}
