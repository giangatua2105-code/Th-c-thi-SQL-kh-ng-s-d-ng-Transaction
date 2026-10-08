package com.codegym.controller;

import com.codegym.dao.UserDAO;
import com.codegym.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        try {
            switch (action) {
                case "create": insertUser(request, response); break;
                case "edit":   updateUser(request, response); break;
                case "delete": deleteUser(request, response); break;
                default:       response.sendRedirect("users");
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";
        try {
            switch (action) {
                case "create": showNewForm(request, response); break;
                case "edit":   showEditForm(request, response); break;
                case "delete": showDeleteForm(request, response); break;
                case "search": searchUser(request, response); break;
                case "sort":   sortUser(request, response); break;
                case "test-without-tran": testWithoutTran(request, response); break;
                default:       listUser(request, response); break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String country = request.getParameter("country");
        if (country == null) country = "";
        country = country.trim();
        List<User> listUser = country.isEmpty() ? userDAO.selectAllUsers() : userDAO.searchByCountry(country);
        request.setAttribute("listUser", listUser);
        request.setAttribute("keyword", country);
        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }

    private void sortUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String order = request.getParameter("order");
        if (!"desc".equalsIgnoreCase(order)) order = "asc";
        List<User> listUser = userDAO.sortByName(order);
        request.setAttribute("listUser", listUser);
        request.setAttribute("order", order);
        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }

    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Gọi phương thức cố tình sinh lỗi
        userDAO.insertUpdateWithoutTransaction();
        System.out.println("Đã chạy xong hàm testWithoutTran. Hãy kiểm tra database!");

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<p>Đã chạy xong hàm testWithoutTran. Hãy xem log của Tomcat và kiểm tra bảng Employee trong database!</p>");
        response.getWriter().println("<a href='users'>Quay lại danh sách</a>");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        // Sử dụng phương thức mới gọi Stored Procedure
        User existingUser = userDAO.getUserById(id);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userDAO.selectUser(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("user/delete.jsp").forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        // Nhận danh sách quyền hạn (permissions) được check từ form
        String[] permissionsStr = request.getParameterValues("permissions");
        int[] permissions = null;

        if (permissionsStr != null) {
            permissions = new int[permissionsStr.length];
            for (int i = 0; i < permissionsStr.length; i++) {
                permissions[i] = Integer.parseInt(permissionsStr[i]);
            }
        }

        User newUser = new User(name, email, country);

        // Gọi phương thức sử dụng Transaction
        userDAO.addUserTransaction(newUser, permissions);

        response.sendRedirect("users");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = new User(id, request.getParameter("name"),
                request.getParameter("email"), request.getParameter("country"));
        userDAO.updateUser(user);
        response.sendRedirect("users");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        response.sendRedirect("users");
    }
}
