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
public class ImportInvoice {

    private int Invoice_ID;
    private int Supplier_ID;
    private Date Invoice_date ;
    private int total_amount;
    private String Invoice_Status;
    private int Employee_ID;

    public ImportInvoice() {
    }

    public int getInvoice_ID() {
        return Invoice_ID;
    }

    public void setInvoice_ID(int Invoice_ID) {
        this.Invoice_ID = Invoice_ID;
    }

    public int getSupplier_ID() {
        return Supplier_ID;
    }

    public void setSupplier_ID(int Supplier_ID) {
        this.Supplier_ID = Supplier_ID;
    }

    public Date getInvoice_date() {
        return Invoice_date;
    }

    public void setInvoice_date(Date Invoice_date) {
        this.Invoice_date = Invoice_date;
    }

    public int getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(int total_amount) {
        this.total_amount = total_amount;
    }

    public String getInvoice_Status() {
        return Invoice_Status;
    }

    public void setInvoice_Status(String Invoice_Status) {
        this.Invoice_Status = Invoice_Status;
    }

    public int getEmployee_ID() {
        return Employee_ID;
    }

    public void setEmployee_ID(int Employee_ID) {
        this.Employee_ID = Employee_ID;
    }

    public ImportInvoice(int Invoice_ID, int Supplier_ID, Date Invoice_date, int total_amount, String Invoice_Status, int Employee_ID) {
        this.Invoice_ID = Invoice_ID;
        this.Supplier_ID = Supplier_ID;
        this.Invoice_date = Invoice_date;
        this.total_amount = total_amount;
        this.Invoice_Status = Invoice_Status;
        this.Employee_ID = Employee_ID;
    }
    
     public ImportInvoice( int Supplier_ID, Date Invoice_date, int total_amount, int Employee_ID) {
        this.Supplier_ID = Supplier_ID;
        this.Invoice_date = Invoice_date;
        this.total_amount = total_amount;
        this.Employee_ID = Employee_ID;
    }

    
}
