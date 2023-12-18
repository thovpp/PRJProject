/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
import Models.Comment;
import Models.Product;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class commentDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public commentDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    //getAll
    public List<Comment> getAllCommentByPID(int PID) {
        List<Comment> list = new ArrayList<>();
        String sql = "select * from comment where product_id =? AND [is_reply] = 0 ORDER BY [comment_id] DESC";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, PID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt("comment_id"),
                        rs.getString("comment_text"),
                        rs.getDate("comment_date"),
                        rs.getString("username"),
                        rs.getInt("product_id")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int addNewComment(Comment comment) {
        String sqlQuery = "INSERT INTO [dbo].[Comment]\n"
                + "           ([comment_text]\n"
                + "           ,[comment_date]\n"
                + "           ,[username]\n"
                + "           ,[product_id]\n"
                + "           ,[is_reply]\n"
                + "           ,[reply_for])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, comment.getComment_text());
            statement.setDate(2, comment.getComment_date());
            statement.setString(3, comment.getUsername());
            statement.setInt(4, comment.getProduct_id());
            statement.setBoolean(5, comment.isIs_reply());
            if (!comment.isIs_reply()) {
                statement.setNull(6, Types.INTEGER);
            } else {
                statement.setInt(6, comment.getReply_for());
            }
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Comment getCommentById(int CID) {
        Comment comment = null;
        String sql = "SELECT * FROM Comment WHERE comment_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, CID);
            rs = ps.executeQuery();
            if (rs.next()) {
                comment = new Comment(
                        rs.getInt("comment_id"),
                        rs.getString("comment_text"),
                        rs.getDate("comment_date"),
                        rs.getString("username"),
                        rs.getInt("product_id"),
                        rs.getBoolean("is_reply"),
                        rs.getInt("reply_for")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comment;
    }

    public int UpdateCommentText(int commentId, String editedText) {
        int kq = 0;
        try {

            String sql = "UPDATE Comment\n"
                    + "SET comment_text = ?\n"
                    + "WHERE comment_id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, editedText);
            ps.setInt(2, commentId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    //addproduct
    public int AddNewComment(String txt, String user, int PID) {
        int kq = 0;
        String sql = "insert into Comment values(?,?,?,?)";
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, txt);
            ps.setString(2, date);
            ps.setString(3, user);
            ps.setInt(4, PID);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    //get total comment
    public int getTotalCM(int PID) {
        rs = null;
        int kq = 0;
        String sql = "select count(Comment.product_id) as [ttcomment] from Comment\n"
                + "where product_id = ?\n"
                + "group by product_id";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, PID);
            rs = ps.executeQuery();
            if (rs.next()) {
                kq = rs.getInt("ttcomment");
            }
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int DeleteCommentByCMTID(int PID, int CommentID) {
        int kq = 0;
        String sql = "delete from Comment where product_id = ? and comment_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, PID);
            ps.setInt(2, CommentID);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public Comment selectById(int comment_id) {
        String sqlQuery = "SELECT TOP (1000) [comment_id]\n"
                + "      ,[comment_text]\n"
                + "      ,[comment_date]\n"
                + "      ,[username]\n"
                + "      ,[product_id]\n"
                + "      ,[is_reply]\n"
                + "      ,[reply_for]\n"
                + "  FROM [My_Product_Website].[dbo].[Comment]\n"
                + "  WHERE [comment_id] = ?";
        try {
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, comment_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Comment comment = new Comment();
                comment.setComment_id(rs.getInt(1));
                comment.setComment_text(rs.getString(2));
                comment.setComment_date(rs.getDate(3));
                comment.setUsername(rs.getString(4));
                comment.setProduct_id(rs.getInt(5));
                comment.setIs_reply(rs.getBoolean(6));
                comment.setReply_for(rs.getInt(7));
                return comment;
            }

        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Comment> selectListCommentOfProduct(int product_id) {
        String sqlQuery = "SELECT TOP (1000) [comment_id]\n"
                + "      ,[comment_text]\n"
                + "      ,[comment_date]\n"
                + "      ,[username]\n"
                + "      ,[product_id]\n"
                + "      ,[is_reply]\n"
                + "      ,[reply_for]\n"
                + "  FROM [My_Product_Website].[dbo].[Comment]\n"
                + "  WHERE [product_id] = ? ORDER BY [is_reply] DESC";
        List<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, product_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Comment comment = new Comment();
                comment.setComment_id(rs.getInt(1));
                comment.setComment_text(rs.getString(2));
                comment.setComment_date(rs.getDate(3));
                comment.setUsername(rs.getString(4));
                comment.setProduct_id(rs.getInt(5));
                comment.setIs_reply(rs.getBoolean(6));
                comment.setReply_for(rs.getInt(7));
                comments.add(comment);
            }

        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comments;
    }
    
    //delete
    public int DeleteComment(int PID) {
        int kq = 0;
        String sql = "delete from Comment where product_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, PID);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int DeleteAllCommentReply(int comment_id) {
        int kq = 0;
        String sql = "delete from Comment where [reply_for] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, comment_id);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int DeleteCommentByPrimaryKey(int comment_id) {
        int kq = 0;
        String sql = "delete from Comment where [comment_id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, comment_id);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int updateComment(Comment comment) {
        String sqlQuery = "UPDATE [dbo].[Comment]\n"
                + "   SET [comment_text] = ?\n"
                + "      ,[comment_date] = ?\n"
                + " WHERE [comment_id] = ?";
        try {
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, comment.getComment_text());
            statement.setDate(2, comment.getComment_date());
            statement.setInt(3, comment.getComment_id());
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Comment> getAllReplyOfComment(int comment_id) {
        String sqlQuery = "SELECT TOP (1000) [comment_id]\n"
                + "      ,[comment_text]\n"
                + "      ,[comment_date]\n"
                + "      ,[username]\n"
                + "      ,[product_id]\n"
                + "      ,[is_reply]\n"
                + "      ,[reply_for]\n"
                + "  FROM [dbo].[Comment]\n"
                + "  WHERE [is_reply] = 1 AND [reply_for] = ? ORDER BY [comment_id] DESC";
        List<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, comment_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setComment_id(rs.getInt(1));
                comment.setComment_text(rs.getString(2));
                comment.setComment_date(rs.getDate(3));
                comment.setUsername(rs.getString(4));
                comment.setProduct_id(rs.getInt(5));
                comment.setIs_reply(rs.getBoolean(6));
                comment.setReply_for(rs.getInt(7));
                comments.add(comment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comments;

    }

    //delete
    public int DeleteCommentByUs(String us) {
        int kq = 0;
        String sql = "delete from Comment where username = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public static void main(String[] args) {
        commentDAO c = new commentDAO();
//        List<Comment> clist = c.getAllCommentByPID(1018);
//        for (Comment o : clist) {
//            System.out.println(o);
//        }
        c.UpdateCommentText(56, "dasdhvashdasdasdas");  
    }

}
