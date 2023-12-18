/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
import Models.Employee;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
 * @author Admin
 */
public class EmployeeDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public EmployeeDAO() {
        conn = DBConnection.DbConnection.getConnection();
    }

    //getAll
    public List<Employee> getAllEmployee() {
        List<Employee> list = new ArrayList<>();
        String sql = "select e.Employee_ID,ac.username,ac.[password],ac.phone_number,e.Employee_Position,e.Employee_Startdate,ac.fullname,e.Employee_Statuas,e.AccountID from Employee e join Account ac on \n"
                + "e.AccountID = ac.account_id";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //add account
    public int addEmployee(Account ac, String position, String status) {
        int kq = 0;
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "insert into Account \n"
                + "values(?,?,?,?,1,0,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, ac.getUsername());
            ps.setString(2, ac.getPassword());
            ps.setString(3, ac.getPhone_number());
            ps.setString(4, ac.getEmail());
            ps.setString(5, ac.getFullname());
            ps.executeUpdate();
            String sql1 = "select top 1 account_id from Account order by account_id desc";
            PreparedStatement ps1 = conn.prepareStatement(sql1);
            ResultSet rss = ps1.executeQuery();
            if (rss.next()) {
                int acid = rss.getInt("account_id");
                String sql2 = "insert into Employee values(?,?,?,?,?,?)";
                PreparedStatement ps2 = conn.prepareStatement(sql2);
                ps2.setString(1, ac.getFullname());
                ps2.setString(2, ac.getPhone_number());
                ps2.setString(3, position);
                ps2.setString(4, date);
                ps2.setInt(5, acid);
                ps2.setString(6, status);
                kq = ps2.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    //updateAccountByAD
    public int UpdateEmoloyee(Account ac, String position, String status) {
        int kq = 0;
        String sql = "UPDATE Account \n"
                + "SET  username = ?, [password] = ?, phone_number = ?, email = ?, fullname = ?, [status] = ?\n"
                + "WHERE account_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, ac.getUsername());
            ps.setString(2, ac.getPassword());
            ps.setString(3, ac.getPhone_number());
            ps.setString(4, ac.getEmail());
            ps.setString(5, ac.getFullname());
            ps.setBoolean(6, ac.isStatus());
            ps.setInt(7, ac.getAccount_id());
            kq = ps.executeUpdate();
            String sql1 = "update Employee set Employee_Position = ? , Employee_Statuas=? where AccountID = ?";
            PreparedStatement ps1 = conn.prepareStatement(sql1);
            ps1.setString(1, position);
            ps1.setString(2, status);
            ps1.setInt(3, ac.getAccount_id());
            kq = ps1.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }
    
    
    //get account by id
    public Employee getEmployeeByAcID(int Ac_id) {
        String sql = "select * from Employee where AccountID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Ac_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Employee(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
     //get account by id
    public Employee getEmployeeByEmpID(int empID) {
        String sql = "select * from Employee where Employee_ID = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, empID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Employee(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
      public int DeleteEmployee(int eid) {
        int kq = 0;
        String sql = "update Employee set Employee_Statuas = N'Nghỉ việc' where Employee_ID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, eid);
             ps.executeUpdate();
            Employee e = getEmployeeByEmpID(eid);
            String sql2 = "update account set [Status] = 0  where account_id = "+e.getAccountID();
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            kq = ps2.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public static void main(String[] args) {
        EmployeeDAO edao = new EmployeeDAO();
        edao.DeleteEmployee(10);
    }
}
