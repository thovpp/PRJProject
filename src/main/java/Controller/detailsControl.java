/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.RatingDAO;
import DAOs.accountDAO;
import DAOs.categoryDAO;
import DAOs.commentDAO;
import DAOs.productDAO;
import Models.Account;
import Models.Cart;
import Models.Category;
import Models.Comment;
import Models.Items;
import Models.Product;
import Models.Rating;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
public class detailsControl extends HttpServlet {

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
        try {
            String path = request.getRequestURI();
            String[] s = path.split("/");
            String pid = s[s.length - 1];
            int PID = Integer.parseInt(pid);

            productDAO dao = new productDAO();
            categoryDAO catedao = new categoryDAO();
            List<Category> listc = catedao.getAllCategory();
            List<Product> list9p = dao.get9NewProduct();
            List<Product> listAll = dao.getAllProduct();
            Product p = dao.getProductByPID(PID);

            Cookie[] cookies = request.getCookies();
            String txt = "";
            if (cookies != null) {
                for (Cookie o : cookies) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
           

            //tao session dua tren cookie
            HttpSession session = request.getSession();
            Account tempAcc = (Account) session.getAttribute("quantri");
            if (session.getAttribute("quantri") == null) {
                String us = "";
                Cookie[] cook = request.getCookies();
                boolean foundCookie = false;
                if (cook != null) {
                    for (Cookie c : cook) {
                        if (c.getName().equals("quantri")) {
                            foundCookie = true;
                            us = c.getValue();
                            break;
                        }
                    }
                    accountDAO acdao = new accountDAO();
                    Account ac = acdao.getAccountByUS(us);
                    if (ac != null) {
                        session.setAttribute("quantri", ac);
                    }
                }
            }

             if(tempAcc != null){
                Cart cart = new Cart(tempAcc.getAccount_id(),txt, listAll);
                List<Items> listItem = cart.getItems();
                int n;
                if (listItem != null) {
                    n = listItem.size();
                } else {
                    n = 0;
                }
                request.setAttribute("size", n);
                }
            
             commentDAO comdao = new commentDAO();
            List<Comment> comlist = comdao.getAllCommentByPID(PID);
            for (Comment comment: comlist) {
                comment.setReplies(comdao.getAllReplyOfComment(comment.getComment_id()));
            }
            int total = comdao.getTotalCM(PID);

            RatingDAO ratingDAO = new RatingDAO();
            float aveRating = ratingDAO.getAverageRatingOfProduct(PID);
            int countRating = ratingDAO.countRating(PID);
            if(request.getSession().getAttribute("quantri") != null){
                Account account = (Account) request.getSession().getAttribute("quantri");
                Rating rating = ratingDAO.selectRatingByComposite(account.getUsername(), PID);
                request.setAttribute("rating", rating);
            }
            request.setAttribute("countRating", countRating);
            request.setAttribute("aveRating", aveRating);
            request.setAttribute("idDT", PID);
            request.setAttribute("totalCM", total);
            request.setAttribute("commentList", comlist);
            request.setAttribute("list9P", list9p);
            request.setAttribute("listC", listc);
            request.setAttribute("Pdetails", p);
            request.getRequestDispatcher("/details.jsp").forward(request, response);
        } catch (Exception e) {
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
