package controller;
import model.*;
import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryDAO categoryDAO;

    public void init() {
        categoryDAO = new CategoryDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            listCategories(request, response);
        } else {
            switch (action) {
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteCategory(request, response);
                    break;
                default:
                    listCategories(request, response);
                    break;
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                insertCategory(request, response);
                break;
            case "update":
                updateCategory(request, response);
                break;
            default:
                listCategories(request, response);
                break;
        }
    }

    private void listCategories(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categoryList", categories);
        request.getRequestDispatcher("category-list.jsp").forward(request, response);
    }

    private void insertCategory(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");

        String categoryName = request.getParameter("categoryName");
        String description = request.getParameter("description");

        Category category = new Category();
        category.setCategoryName(categoryName);
        category.setDescription(description);
        category.setCreatedBy(user.getAccountId());
        category.setUpdatedBy(user.getAccountId());

        categoryDAO.addCategory(category);
        response.sendRedirect("category");
    }

   private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    Category category = categoryDAO.getCategoryById(id);
    request.setAttribute("category", category);
    request.getRequestDispatcher("editCategory.jsp").forward(request, response);
}


    private void updateCategory(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");

        int id = Integer.parseInt(request.getParameter("id"));
        String categoryName = request.getParameter("categoryName");
        String description = request.getParameter("description");

        Category category = new Category();
        category.setCategoryId(id);
        category.setCategoryName(categoryName);
        category.setDescription(description);
        category.setUpdatedBy(user.getAccountId());

        categoryDAO.updateCategory(category);
        response.sendRedirect("category");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        categoryDAO.deleteCategory(id);
        response.sendRedirect("category");
    }
}
