/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.accountDAO;
import DAOs.orderDAO;
import DAOs.orderdetailsDAO;
import DAOs.productDAO;
import Models.Account;
import Models.Cart;
import Models.Items;
import Models.Order;
import Models.OrderDeltail;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderHistoryController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderHistoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderHistoryController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        productDAO dao = new productDAO();
        List<Product> listAll = dao.getAllProduct();

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
        Account tempAcc = (Account) session.getAttribute("quantri");
        if (tempAcc != null) {
            Cart cart = new Cart(tempAcc.getAccount_id(), txt, listAll);
            List<Items> listItem = cart.getItems();
            int n;
            if (listItem != null) {
                n = listItem.size();
            } else {
                n = 0;
            }

            productDAO POdao = new productDAO();

            orderdetailsDAO dtdao = new orderdetailsDAO();
            orderDAO odao = new orderDAO();

            List<OrderDeltail> detailList = dtdao.getdetailByAcIDjoin(tempAcc.getAccount_id());
            request.setAttribute("listTails", detailList);
            List<Product> adao = new ArrayList<>();
            List<Order> oderdao = new ArrayList<>();
            for (int i = 0; i < detailList.size(); i++) {
                oderdao = odao.getOrderByID(i);
                Product ppdao = POdao.getProductByPID(detailList.get(i).getProduct_id());
                adao.add(ppdao);
            }
            request.setAttribute("odao", oderdao);
            request.setAttribute("infoProduct", adao);

            request.setAttribute("size", n);

            String oid = request.getParameter("ppid");

            if (oid != null) {
                int pid = Integer.parseInt(oid);
                orderDAO ordao = new orderDAO();
                productDAO updateQuantityDAO = new productDAO();
                List<Order> ord = ordao.getOrderByID(pid);
                orderdetailsDAO oodao = new orderdetailsDAO();
                List<OrderDeltail> ListOTails = oodao.getOrderdetailByOID(pid);
                int updateQuatity = 0;
                if (ord == null) {
                    response.sendRedirect("/PRJProject/home");
                } else {
                    for (int i = 0; i < ListOTails.size(); i++) {
                    updateQuatity = ListOTails.get(i).getQuantity();
                    updateQuantityDAO.UpdateQuantityProductCancelOrder(updateQuatity, ListOTails.get(i).getProduct_id());
                    }
                    ordao.UpdateStatus("Đã hủy", pid);
                }
                response.sendRedirect("/PRJProject/orderhistory");
            }

            String againOID = request.getParameter("againOID");
            if (againOID != null) {
                orderdetailsDAO oodao = new orderdetailsDAO();
                List<OrderDeltail> ListOTail = oodao.getOrderdetailByOID(Integer.parseInt(againOID));
                String txtt = "";
                String numm = "";

                Account ac = (Account) session.getAttribute("quantri");
                if (ac == null) {
                    response.sendRedirect("/PRJProject/login");
                }

                Cookie[] cookiess = request.getCookies();

                productDAO ddao = new productDAO();
                List<Product> listAllP = ddao.getAllProduct();
                String txtTemp = "";
                if (cookiess != null) {
                    for (Cookie o : cookiess) {
                        if (o.getName().equals("cart")) {
                            txtt += o.getValue();
                            txtTemp = txtt;
                            o.setMaxAge(0);
                            response.addCookie(o);
                        }
                    }
                }
                int check = 0;
                String checkM = "";
                String checkidP = "";
                for (int i = 0; i < ListOTail.size(); i++) {
                    String id = String.valueOf(ListOTail.get(i).getProduct_id());
                    checkidP = id;
                    numm = String.valueOf(ListOTail.get(i).getQuantity());
                    Product p = ddao.getProductByPID(ListOTail.get(i).getProduct_id());
                    check = Integer.parseInt(numm);
                    if (check > p.getStock_quantity()) {
                        check = 0;
                    }
                    if (txtt.isEmpty()) {
                        txtt = ac.getAccount_id() + ":" + id + ":" + numm;
                    } else {
                        txtt = txtt + "," + ac.getAccount_id() + ":" + id + ":" + numm;//1003:1, id moi + num moi
                    }
                }

                int checknum = 0;
                int checkidpincart = 0;
                

                if (txtt != null && txtt.length() != 0) {
                    String[] s = txtt.split(","); //1003:1,1003:1
                    for (String o : s) {
                        String[] nn = o.split(":");
                        int acID = Integer.parseInt(nn[0]);
                        if (ac.getAccount_id() == acID) {
                            int idPInCart = Integer.parseInt(nn[1]);//1003
                            int quantityInCart = Integer.parseInt(nn[2]);//1
                            if (idPInCart == Integer.parseInt(checkidP)) {
                                checkidpincart = Integer.parseInt(checkidP);
                                checknum += quantityInCart;
                            }
                        }
                    }
                }

                productDAO ppDAO = new productDAO();
                Product pp = ppDAO.getProductByPID(Integer.parseInt(checkidP));
                int checkerr = 1;
                if (pp.getStock_quantity() < checknum) {
                    checkerr = 0;
                }

                if (check != 0 && checkerr != 0) {
                    Cookie c = new Cookie("cart", txtt);// them vao lai cookie
                    c.setMaxAge(24 * 60 * 60 * 3);
                    response.addCookie(c);
                } else {
                    Cookie c = new Cookie("cart", txtTemp);// them vao lai cookie
                    c.setMaxAge(24 * 60 * 60 * 3);
                    response.addCookie(c);
                    checkM = "Số lượng sản phẩm bạn chọn mua lại đã đạt quá giới hạn hoặc sản phẩm đã hết hàng";
                    request.setAttribute("CheckM", checkM);
                    request.getRequestDispatcher("/OrDHistory.jsp").forward(request, response);
                }

                Cart cartt = new Cart(tempAcc.getAccount_id(), txtt, listAllP);
//                request.setAttribute("checkn", pp.getStock_quantity());
                request.setAttribute("cart", cartt);
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
            }
            request.getRequestDispatcher("/OrDHistory.jsp").forward(request, response);
        }
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
