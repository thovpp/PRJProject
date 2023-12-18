package Controller;

import DAOs.commentDAO;
import Helpers.Helpers;
import Models.Account;
import Models.Comment;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "ReplyComment", urlPatterns = "/reply-comment")
public class ReplyCommentAjax extends HttpServlet {
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
        String commentText = request.getParameter("commentText");
        if(request.getParameter("replyFor") == null){
            handleError(response);
            return;
        }
        int reply_for = Helpers.parseInt(request.getParameter("replyFor"), -1);
        if(reply_for == -1){
            handleError(response);
            return;
        }
        String username = request.getParameter("username");
        Account account = ((Account) request.getSession().getAttribute("quantri"));
        if(!username.equals(account.getUsername())){
            handleError(response);
            return;
        }
        int product_id = Helpers.parseInt(request.getParameter("productId"), -1);
        Comment comment = new Comment();
        comment.setComment_text(commentText);
        comment.setComment_date(Helpers.getDateNow());
        comment.setUsername(username);
        comment.setIs_reply(true);
        comment.setReply_for(reply_for);
        comment.setProduct_id(product_id);
        commentDAO cmtDao = new commentDAO();
        int resultInsert = cmtDao.addNewComment(comment);
        if(resultInsert != 1){
            handleError(response);
            return;
        }
        else{
            response.getWriter().write(new Gson().toJson(comment));
        }
    }
}
