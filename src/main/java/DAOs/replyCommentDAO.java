/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Comment;
import Models.ReplyComment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class replyCommentDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public replyCommentDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public List<ReplyComment> getAllReplyCommentByCID(int CID) {
        List<ReplyComment> list = new ArrayList<>();
        String sql = "select * from ReplyComment where comment_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, CID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ReplyComment(rs.getInt("replyComment_id"),
                        rs.getString("replyComment_text"),
                        rs.getDate("replyComment_date"),
                        rs.getString("username"),
                        rs.getInt("comment_id")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ReplyComment getReplyCommentById(String CID) {
        ReplyComment comment = null;
        String sql = "SELECT * FROM ReplyComment WHERE replyComment_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, CID);
            rs = ps.executeQuery();
            if (rs.next()) {
                comment = new ReplyComment(rs.getInt("replyComment_id"),
                        rs.getString("replyComment_text"),
                        rs.getDate("replyComment_date"),
                        rs.getString("username"),
                        rs.getInt("comment_id")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comment;
    }

    public int AddNewReplyComment(String txt, String user, int CID) {
        int kq = 0;
        String sql = "INSERT INTO ReplyComment\n"
                + "VALUES (?, ?, ?, ?);";
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, txt);
            ps.setString(2, date);
            ps.setString(3, user);
            ps.setInt(4, CID);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
Logger.getLogger(commentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public static void main(String[] args) {
        replyCommentDAO dao = new replyCommentDAO();
        List<ReplyComment> list = dao.getAllReplyCommentByCID(12);
        for (ReplyComment o : list) {
            System.out.println(o);
        }
    }
}