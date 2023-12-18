/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Employee {

    private int Employee_ID;
    private String Employee_Fullname;
    private String Employee_Phone;
    private String Employee_Position;
    private Date Employee_Startdate;
    private int AccountID;
    private String Employee_Statuas;
    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Employee() {
    }

    public Employee(int Employee_ID, String Employee_Fullname, String Employee_Phone, String Employee_Position, Date Employee_Startdate, int AccountID, String Employee_Statuas) {
        this.Employee_ID = Employee_ID;
        this.Employee_Fullname = Employee_Fullname;
        this.Employee_Phone = Employee_Phone;
        this.Employee_Position = Employee_Position;
        this.Employee_Startdate = Employee_Startdate;
        this.AccountID = AccountID;
        this.Employee_Statuas = Employee_Statuas;
    }

    public Employee(String Employee_Fullname, String Employee_Phone, String Employee_Position, String Employee_Statuas) {
        this.Employee_Fullname = Employee_Fullname;
        this.Employee_Phone = Employee_Phone;
        this.Employee_Position = Employee_Position;
        this.Employee_Statuas = Employee_Statuas;
    }

    public Employee(int Employee_ID, String username, String password, String Employee_Phone, String Employee_Position, Date Employee_Startdate, String Employee_Fullname, String Employee_Statuas,int AccountID) {
        this.Employee_ID = Employee_ID;
        this.Employee_Fullname = Employee_Fullname;
        this.Employee_Phone = Employee_Phone;
        this.Employee_Position = Employee_Position;
        this.Employee_Startdate = Employee_Startdate;
        this.Employee_Statuas = Employee_Statuas;
        this.username = username;
        this.password = password;
        this.AccountID = AccountID;
    }

    public int getEmployee_ID() {
        return Employee_ID;
    }

    public void setEmployee_ID(int Employee_ID) {
        this.Employee_ID = Employee_ID;
    }

    public String getEmployee_Fullname() {
        return Employee_Fullname;
    }

    public void setEmployee_Fullname(String Employee_Fullname) {
        this.Employee_Fullname = Employee_Fullname;
    }

    public String getEmployee_Phone() {
        return Employee_Phone;
    }

    public void setEmployee_Phone(String Employee_Phone) {
        this.Employee_Phone = Employee_Phone;
    }

    public String getEmployee_Position() {
        return Employee_Position;
    }

    public void setEmployee_Position(String Employee_Position) {
        this.Employee_Position = Employee_Position;
    }

    public Date getEmployee_Startdate() {
        return Employee_Startdate;
    }

    public void setEmployee_Startdate(Date Employee_Startdate) {
        this.Employee_Startdate = Employee_Startdate;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public String getEmployee_Statuas() {
        return Employee_Statuas;
    }

    public void setEmployee_Statuas(String Employee_Statuas) {
        this.Employee_Statuas = Employee_Statuas;
    }

    

   
   

    public String toString() {
        return Employee_ID + ", " + username + " " + password + " " + Employee_Position + " " + Employee_Startdate;
    }

}
