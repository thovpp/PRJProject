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
 * @author Admin
 */
public class productDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public productDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    //getAll
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where product_status = N'Đang hoạt động' or product_status =N'Hết hàng'";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //getAll
    public List<Product> getAllProductActive() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where product_status = N'Đang hoạt động'";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //getAll
    public List<Product> getAllProductByAdwait() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where product_status = N'Chờ duyệt'";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //getAll
    public List<Product> getAllProductByAdstop() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where product_status = N'Ngừng bán'";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //getAll
    public List<Product> getAllProductByAdoutofstock() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where product_status = N'Hết hàng'";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //get 4 new product 
    public List<Product> get4NewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 4 * FROM Product where product_status = N'Đang hoạt động' or product_status =N'Hết hàng'\n"
                + "ORDER BY product_id DESC;";
        try {
            ps = conn.prepareStatement(sql);
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

    //get 8 new product 
    public List<Product> get8NewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 8 * FROM Product where product_status = N'Đang hoạt động' or product_status =N'Hết hàng'\n"
                + "ORDER BY product_id DESC;";
        try {
            ps = conn.prepareStatement(sql);
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

    //get 9 new product 
    public List<Product> get9NewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 9 * FROM Product where product_status = N'Đang hoạt động' or product_status =N'Hết hàng'\n"
                + "ORDER BY product_id DESC;";
        try {
            ps = conn.prepareStatement(sql);
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

    //getAll product By cateId
    public List<Product> getAllproductByCateID(int cateID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where category_id = ? and product_status = N'Đang hoạt động' or product_status =N'Hết hàng'";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cateID);
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

    //getProductbyID
    public Product getProductByPID(int pID) {
        String sql = "select*from Product where product_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9));
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //SearchProductByName
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "where [product_name] like ? and product_status = N'Đang hoạt động' or product_status =N'Hết hàng'";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
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

    //SearchProductByColors
    public List<Product> searchByColor(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from  Product where product_color = ? and product_status = N'Đang hoạt động' or product_status =N'Hết hàng'";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, txtSearch);
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

    //Count Product
    public int countTotalProduct() {
        String sql = "select count(*) from Product";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //paging Product
    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where product_status = N'Đang hoạt động' or product_status =N'Hết hàng'\n"
                + "order by product_id desc\n"
                + "offset ? rows fetch next 8 rows only;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 8);
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

    //load Product
    public List<Product> getNext8Product(int amount) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where product_status = N'Đang hoạt động' or product_status =N'Hết hàng'\n"
                + "order by product_id desc\n"
                + "offset ? rows fetch next 8 rows only;";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, amount);
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

    //addproduct
    public int AddNewProduct(Product p) {
        int kq = 0;
        String sql = "insert into product values(?, ?, ?, ?, ?, ?, ?, N'Chờ duyệt', ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getProduct_pic());
            ps.setString(3, p.getProduct_color());
            ps.setInt(4, p.getPrice());
            ps.setInt(5, p.getStock_quantity());
            ps.setString(6, p.getDes());
            ps.setInt(7, p.getCategory_id());
            ps.setInt(8, p.getSupplier_id());
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    //delete
    public int DeleteProduct(String pro_id) {
        int kq = 0;
        String sql = "delete from product where product_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pro_id);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
    //update

    public int UpdateProduct(Product p) {
        int kq = 0;
        String sql = "update product set product_name=?, product_pic=?, product_color=?, price=?, stock_quantity=?, des=?, category_id=?, product_status=? where product_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getProduct_pic());
            ps.setString(3, p.getProduct_color());
            ps.setInt(4, p.getPrice());
            ps.setInt(5, p.getStock_quantity());
            ps.setString(6, p.getDes());
            ps.setInt(7, p.getCategory_id());
            ps.setString(8, p.getProduct_status());
            ps.setInt(9, p.getProduct_id());

            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int UpdateProductoutofstock(int pid) {
        int kq = 0;
        String sql = "update product set stock_quantity=0 where product_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
    
     public int UpdateQuantityProductCancelOrder(int num, int pid) {
        int kq = 0;
        String sql = "update product set stock_quantity= stock_quantity + ? where product_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, num);
            ps.setInt(2, pid);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int UpdateProduc_Statustoutofstock(int pid) {
        int kq = 0;
        String sql = "update product set product_status = N'Hết hàng' where product_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int DelProduct_ByUpdate(int pid) {
        int kq = 0;
        String sql = "update product set product_status = N'Ngừng bán' where product_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    //LocTh
    public int getProductIdByCommentId(int commentId) {
        int productId = -1; // Initialize with a default value or error code

        String sql = "SELECT product_id FROM Comment WHERE comment_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, commentId);
            rs = ps.executeQuery();

            if (rs.next()) {
                productId = rs.getInt("product_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return productId;
    }

    public static void main(String[] args) {
        productDAO dao = new productDAO();
        Product p = new Product(1065, "test1", "test1", "test1", 1, 10, "test1", 2, "Chờ");
        System.out.println(dao.UpdateProduct(p));
    }
}
