package controller;

import dal.CategoryDAO;
import model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

@WebServlet("/EditCategoryServlet")
public class EditCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryDAO categoryDAO;

    public void init() {
        categoryDAO = new CategoryDAO();
    }

    // Hiển thị form chỉnh sửa
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        Category category = categoryDAO.getCategoryById(categoryId);

        request.setAttribute("category", category);
        request.getRequestDispatcher("editCategory.jsp").forward(request, response);
    }

    // Xử lý cập nhật danh mục
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          HttpSession session = request.getSession();
//        Account user = (Account) session.getAttribute("account");
//        if (user == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
//        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
//        String name = request.getParameter("name");
//          if (name == null || name.trim().isEmpty()) {
//        request.setAttribute("msg", "Tên danh mục không được để trống hoặc chỉ chứa khoảng trắng!");
//        request.getRequestDispatcher("editCategory.jsp").forward(request, response);
//        return;
//    }
//        String description = request.getParameter("description");
//        int updatedBy = user.getAccountId();
//
//        Category category = new Category(categoryId, name, description, updatedBy);
//        categoryDAO.updateCategory(category);
//
//        response.sendRedirect("CategoryListServlet");
    }
}
