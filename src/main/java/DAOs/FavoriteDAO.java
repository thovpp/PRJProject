/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuocLe
 */
public class FavoriteDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public FavoriteDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }
    
    
    public boolean isProductFavorited(String product_id, String account_id) {
        boolean isFavorited = false;

        try {
            String query = "SELECT * FROM Favorite WHERE product_id = ? AND account_id = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, product_id);
            ps.setString(2, account_id);

            rs = ps.executeQuery();

            if (rs.next()) {
                isFavorited = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isFavorited;
    }

    public void addProductToFavorites(String product_id, String account_id) {

        try {
            String query = "INSERT INTO Favorite (isFavorite, product_id, account_id) VALUES (1, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, product_id);
            ps.setString(2, account_id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void DeleteFavorites(int acID, int pID) {

        try {
            
            String query = "delete from Favorite where account_id = ? and product_id = ? ";
            ps = conn.prepareStatement(query);
            ps.setInt(1, acID);
            ps.setInt(2, pID);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllFaProduct(int acID) {
        List<Product> list = new ArrayList<>();
        String sql = "select* from Product p\n" +
"                join Favorite f on p.product_id = f.product_id\n" +
"                join Account a on a.account_id = f.account_id\n" +
"                where f.isFavorite = 1 and a.account_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, acID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int setisFaProduct(String p, String cusID) {
        int kq = 0;
        String sql = "update Favorite set isFavorite = 1 where product_id = ? and account_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p);
            ps.setString(2, cusID);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
    
    public int setisNotFaProduct(String p, String cusID) {
        int kq = 0;
        String sql = "update Favorite set isFavorite = 0 where product_id = ? and account_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p);
            ps.setString(2, cusID);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public static void main(String[] args) {
//        FavoriteDAO dao = new FavoriteDAO();
          
//        dao.setisFaProduct("23", "1");
        }
    }