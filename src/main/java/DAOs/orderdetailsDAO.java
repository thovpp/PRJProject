/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Order;
import Models.OrderDeltail;
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
public class orderdetailsDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public orderdetailsDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    //getbyOrderID
    public List<OrderDeltail> getOrderdetailByOID(int orderID) {
        List<OrderDeltail> list = new ArrayList<>();
        String sql = "select * from [OrderDetail] where order_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDeltail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(orderdetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //Delete details
    public int DeleteDetails(int id) {
        int kq = 0;
        String sql = "delete from OrderDetail where order_id= ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(orderdetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    //Delete details By PID
    public int DeleteDetailsByPID(int PID) {
        int kq = 0;
        String sql = "delete from OrderDetail where product_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, PID);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(orderdetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
    //getbyOrderID

    public List<OrderDeltail> getdetailByAcIDjoin(int acID) {
        List<OrderDeltail> list = new ArrayList<>();
        String sql = "select product_id,order_date,unit_price,quantity,order_status,[order].order_id from [Order] join OrderDetail on \n" +
"                [Order].order_id = OrderDetail.order_id\n" +
"                where account_id = ? order by OrderDetail.order_id desc";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, acID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDeltail(rs.getInt(1),
                        rs.getDate(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(orderdetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        orderdetailsDAO dao = new orderdetailsDAO();
        List<OrderDeltail> list = dao.getdetailByAcIDjoin(1);
        for (OrderDeltail o : list) {
            System.out.println(o);
        }
    }

}
