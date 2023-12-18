/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.ImportInvoice;
import Models.Items;
import Models.ItemsInvoice;
import Models.Supplier;
import java.sql.Connection;
import java.sql.Date;
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
public class ImportInvoiceDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ImportInvoiceDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    //getAll
    public List<ImportInvoice> getAllImportInvoice() {
        List<ImportInvoice> list = new ArrayList<>();
        String sql = "select * from ImportInvoice";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ImportInvoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImportInvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int addImportInvoice(ImportInvoice Im, List<ItemsInvoice> itemInvoice) {
        int kq = 0;
        String sql = "insert into ImportInvoice values(?,?,?,N'Đã lên đơn hàng',?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Im.getSupplier_ID());
            ps.setDate(2, Im.getInvoice_date());
            ps.setInt(3, Im.getTotal_amount());
            ps.setInt(4, Im.getEmployee_ID());
            kq = ps.executeUpdate();
            //lay id order moi add
            String sql1 = "select top 1 Invoice_ID from ImportInvoice order by Invoice_ID desc";
            PreparedStatement ps1 = conn.prepareStatement(sql1);
            ResultSet rss = ps1.executeQuery();
            //add orderDetails
            if (rss.next()) {
                int oid = rss.getInt("Invoice_ID");
                for (ItemsInvoice i : itemInvoice) {
                    String sql2 = "insert into [importInvoiceDetail] values(?,?,?,?)";
                    PreparedStatement ps2 = conn.prepareStatement(sql2);
                    ps2.setInt(1, oid);
                    ps2.setInt(2, i.getProduct_ID());
                    ps2.setInt(3, i.getQuantity());
                    ps2.setInt(4, i.getUnit_price());
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImportInvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public static void main(String[] args) {
        ImportInvoiceDAO imp = new ImportInvoiceDAO();
        ImportInvoice im = new ImportInvoice(2, Date.valueOf("2023-10-10"), 110, 2);
        ItemsInvoice iteminvoice = new ItemsInvoice(1037, 10, 630);
        ItemsInvoice iteminvoice2 = new ItemsInvoice(2, 10, 520);
        ArrayList<ItemsInvoice> ilist = new ArrayList<>();
        ilist.add(iteminvoice);
        ilist.add(iteminvoice2);
        imp.addImportInvoice(im, ilist);
    }

}
