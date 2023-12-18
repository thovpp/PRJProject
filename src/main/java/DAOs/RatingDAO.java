package DAOs;

import Models.Rating;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RatingDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public RatingDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    public Rating selectRatingByComposite(String username, int product_id){
        String sqlQuery = "SELECT [username]\n" +
                "      ,[product_id]\n" +
                "      ,[rating_star]\n" +
                "  FROM [dbo].[Rating]\n" +
                "  WHERE [username] = ? AND [product_id] = ?";
        try{
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, username);
            statement.setInt(2, product_id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                Rating rating = new Rating();
                rating.setUsername(rs.getString(1));
                rating.setProduct_id(rs.getInt(2));
                rating.setRating_star(rs.getInt(3));
                return rating;
            }
        }catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public float getAverageRatingOfProduct(int product_id){
        String sqlQuery = "SELECT CAST(AVG(rating_star * 1.0) AS FLOAT) as average_rating\n" +
                "FROM [dbo].[Rating]\n" +
                "WHERE product_id = ?\n" +
                "GROUP BY product_id;";
        try{
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, product_id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                return rs.getFloat(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0f;
    }

    public int countRating(int product_id){
        String sqlQuery = "SELECT COUNT(rating_star) as total_ratings_count\n" +
                "FROM dbo.[Rating]\n" +
                "WHERE product_id = ?\n" +
                "GROUP BY product_id;";
        try{
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, product_id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public int addNewRating(Rating rating){
        String sqlQuery = "INSERT INTO [dbo].[Rating]\n" +
                "           ([username]\n" +
                "           ,[product_id]\n" +
                "           ,[rating_star])\n" +
                "     VALUES\n" +
                "           (?\n" +
                "           ,?\n" +
                "           ,?)";
        try{
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, rating.getUsername());
            statement.setInt(2, rating.getProduct_id());
            statement.setInt(3, rating.getRating_star());
            return statement.executeUpdate();
        }catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int updateRating(Rating rating){
        String sqlQuery = "UPDATE [dbo].[Rating]\n" +
                "   SET [rating_star] = ?\n" +
                " WHERE [username] = ? AND [product_id] = ?";
        try{
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, rating.getRating_star());
            statement.setString(2, rating.getUsername());
            statement.setInt(3, rating.getProduct_id());
            return statement.executeUpdate();
        }catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    
    public int deleteRatingProductByProductId(int product_id){
        String sqlQuery = "DELETE FROM [Rating] WHERE [product_id] = ?";
        try{
            PreparedStatement statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, product_id);
            return statement.executeUpdate();
        }catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
