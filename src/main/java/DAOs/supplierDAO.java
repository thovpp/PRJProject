/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
import Models.Supplier;
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
public class supplierDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public supplierDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    //getAll
    public List<Supplier> getAllSupplier() {
        List<Supplier> list = new ArrayList<>();
        String sql = "select * from Supplier";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Supplier(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(supplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
     //getAll
    public List<Supplier> getAllSupplierActive() {
        List<Supplier> list = new ArrayList<>();
        String sql = "select * from Supplier where supplier_Status = 1";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Supplier(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(supplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
     public Supplier getSupplierBySID(int Sid ) {
        String sql = "select * from Supplier where supplier_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Sid);
            rs = ps.executeQuery();
            
            if(rs.next()){
            return new Supplier(rs.getInt(1),
                    rs.getString(2),
                     rs.getString(3),
                     rs.getString(4),
                     rs.getString(5),
                     rs.getBoolean(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(supplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //add account by Admin
    public int addSupplierByAdmin(Supplier sup) {
        int kq = 0;
        String sql = "insert into Supplier values (?,?,?,?,1);";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, sup.getSupplier_Name());
            ps.setString(2, sup.getSupplier_Address());
            ps.setString(3, sup.getSupplier_phone());
            ps.setString(4, sup.getSupplier_Email());
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(supplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int UpdateSupplier(Supplier sup) {
        int kq = 0;
        String sql = "update Supplier set supplier_Name = ?, supplier_Address= ?, supplier_phone=?, supplier_Email = ?, supplier_Status = ? where supplier_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sup.getSupplier_Name());
            ps.setString(2, sup.getSupplier_Address());
            ps.setString(3, sup.getSupplier_phone());
            ps.setString(4, sup.getSupplier_Email());
            ps.setBoolean(5, sup.isSupplier_Status());
            ps.setInt(6, sup.getSupplier_id());
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(supplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
    
      public int DeleteSupplier(int id) {
        int kq = 0;
        String sql = "update supplier set supplier_Status = 0 where Supplier_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(supplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
    
    public static void main(String[] args) {
        supplierDAO supDAO = new supplierDAO();
////        Supplier sup = new Supplier("777", "7777", "444777", "4744", true);
//        Supplier listSup = supDAO.getSupplierBySID(1);
//        System.out.println(listSup);
supDAO.DeleteSupplier(6);
    }

}
