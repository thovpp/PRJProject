package Controller;

import DAOs.RatingDAO;
import DAOs.commentDAO;
import DAOs.orderDAO;
import Helpers.Helpers;
import Models.Account;
import Models.Comment;
import Models.Rating;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Rating", urlPatterns = "/rating")
public class RatingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private void handleError(HttpServletResponse response) throws ServletException, IOException {
        response.setStatus(400);
        response.getWriter().write("Error data");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("quantri") == null){
            handleError(response);
            return;
        }

        String ratingStar = request.getParameter("selectedRating");

        int rating_star =  Helpers.parseInt(ratingStar, -1);
        if(rating_star < 1 && rating_star > 5){
            handleError(response);
            return;
        }


        Account account = ((Account) request.getSession().getAttribute("quantri"));

        int product_id = Helpers.parseInt(request.getParameter("productId"), -1);
        if(product_id == -1){
            handleError(response);
        }
        orderDAO oDao = new orderDAO();
        if(!oDao.checkIfUserOrderAProduct(account.getAccount_id(), product_id)){
            handleError(response);
            return;
        }
        Rating rating = new Rating();
        rating.setUsername(account.getUsername());
        rating.setProduct_id(product_id);
        rating.setRating_star(rating_star);
        RatingDAO ratingDAO = new RatingDAO();
        Rating ratingFromDb = ratingDAO.selectRatingByComposite(account.getUsername(), product_id);
        int result = 0;
        if(ratingFromDb != null){
            result = ratingDAO.updateRating(rating);
        }
        else {
            result = ratingDAO.addNewRating(rating);
        }
        if(result != 1){
            handleError(response);
            return;
        }
        else{
            response.sendRedirect(request.getContextPath()+"/details/"+product_id+"?action=rating");
        }
    }
}
