/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.productDAO;
import Models.Account;
import Models.Cart;
import Models.Items;
import Models.Product;
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
public class BuyControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account ac = (Account) session.getAttribute("quantri");
        if (ac == null) {
            response.sendRedirect("/PRJProject/login");
        }

        Cookie[] cookies = request.getCookies();
        String txt = "";
        String checktxt = "";
        if (cookies != null) {
            for (Cookie o : cookies) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();//1003:1
                    checktxt = txt;
                    o.setMaxAge(0);
                    response.addCookie(o);
                    break;
                }
            }
        }

        productDAO dao = new productDAO();
        List<Product> listAll = dao.getAllProduct();
        String id = request.getParameter("id");
        String num = request.getParameter("num");
        if (txt.isEmpty()) {
            txt = ac.getAccount_id() + ":" + id + ":" + num;
        } else {
            txt = txt + "," + ac.getAccount_id() + ":" + id + ":" + num;//1003:1, id moi + num moi
        }

        int checknum = 0;
        int checkidpincart = 0;

        if (txt != null && txt.length() != 0) {
            String[] s = txt.split(","); //1003:1,1003:1
            for (String o : s) {
                String[] n = o.split(":");
                int acID = Integer.parseInt(n[0]);
                if (ac.getAccount_id() == acID) {
                    int idPInCart = Integer.parseInt(n[1]);//1003
                    int quantityInCart = Integer.parseInt(n[2]);//1
                    if (idPInCart == Integer.parseInt(id)) {
                        checkidpincart = Integer.parseInt(id);
                        checknum += quantityInCart;
                    }

                }
            }
        }

        Product CheckP = dao.getProductByPID(Integer.parseInt(id));

        if (CheckP.getStock_quantity() < checknum) {
            Cookie c = new Cookie("cart", checktxt);// them vao lai cookie
            c.setMaxAge(24 * 60 * 60 * 3);
            response.addCookie(c);
            request.setAttribute("checknum", checknum);
            request.getRequestDispatcher("/details/" + id).forward(request, response);
        }
        Cookie c = new Cookie("cart", txt);// them vao lai cookie
        c.setMaxAge(24 * 60 * 60 * 3);
        response.addCookie(c);
        txt = "";
        if (cookies != null) {
            for (Cookie o : cookies) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        int n;
        Cart cart = new Cart(ac.getAccount_id(), txt, listAll);
        List<Items> items = cart.getItems();
        if (!items.isEmpty()) {
            n = items.size();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);

        request.setAttribute("checknum", checknum);
        request.getRequestDispatcher("/details/" + id).forward(request, response);
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
