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

@WebServlet(name = "Comment", urlPatterns = "/comment")
public class CommentController extends HttpServlet {
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

    protected void doPost_Delete(HttpServletRequest request, HttpServletResponse response)
        throws  ServletException, IOException {
        if(request.getParameter("commentId") == null){
            handleError(response);
            return;
        }
        int product_id = Helpers.parseInt(request.getParameter("productId"), -1);
        if(product_id == -1){
            handleError(response);
            return;
        }
        int comment_id =  Helpers.parseInt(request.getParameter("commentId"), -1);
        if(comment_id == -1){
            handleError(response);
            return;
        }

        commentDAO cmtDao = new commentDAO();
        Comment comment= cmtDao.selectById(comment_id);
        if(comment == null){
            handleError(response);
            return;
        }
        if(!comment.isIs_reply()){
            cmtDao.DeleteAllCommentReply(comment_id);
        }
        int result = cmtDao.DeleteCommentByPrimaryKey(comment_id);
        if(result == 1){
            response.sendRedirect(request.getContextPath()+"/details/"+product_id+"?action=deleteCmt");
        }
    }

    protected void doPost_Edit(HttpServletRequest request, HttpServletResponse response)
            throws  ServletException, IOException {
        if(request.getParameter("commentId") == null){
            handleError(response);
            return;
        }
        int product_id = Helpers.parseInt(request.getParameter("productId"), -1);
        if(product_id == -1){
            handleError(response);
            return;
        }
        int comment_id =  Helpers.parseInt(request.getParameter("commentId"), -1);
        if(comment_id == -1){
            handleError(response);
            return;
        }

        String comment_text = request.getParameter("commentText").trim();

        commentDAO cmtDao = new commentDAO();
        Comment comment= cmtDao.selectById(comment_id);
        if(comment == null){
            handleError(response);
            return;
        }
        comment.setComment_text(comment_text);
        comment.setComment_date(Helpers.getDateNow());
        int result = cmtDao.updateComment(comment);
        if(result == 1){
            response.sendRedirect(request.getContextPath()+"/details/"+product_id+"?action=editCmt");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("quantri") == null){
            handleError(response);
            return;
        }
        if(request.getParameter("action") != null && request.getParameter("action").equals("delete")){
            doPost_Delete(request, response);
            return;
        }
        if(request.getParameter("action") != null && request.getParameter("action").equals("edit")){
            doPost_Edit(request, response);
            return;
        }
        String commentText = request.getParameter("commentText");

        Account account = ((Account) request.getSession().getAttribute("quantri"));

        int product_id = Helpers.parseInt(request.getParameter("productId"), -1);
        if(product_id == -1){
            handleError(response);
        }
        Comment comment = new Comment();
        comment.setComment_text(commentText);
        comment.setComment_date(Helpers.getDateNow());
        comment.setUsername(account.getUsername());
        comment.setIs_reply(false);
        comment.setProduct_id(product_id);
        commentDAO cmtDao = new commentDAO();
        int resultInsert = cmtDao.addNewComment(comment);
        if(resultInsert != 1){
            handleError(response);
            return;
        }
        else{
            response.sendRedirect(request.getContextPath()+"/details/"+product_id+"?action=addCmt");
        }
    }
}
