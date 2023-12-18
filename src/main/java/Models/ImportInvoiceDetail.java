/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class ImportInvoiceDetail {

    private int Invoice_ID;
    private int Product_ID;
    private int Quantity;
    private int Unit_Price;

    public ImportInvoiceDetail() {
    }

    public ImportInvoiceDetail(int Invoice_ID, int Product_ID, int Quantity, int Unit_Price) {
        this.Invoice_ID = Invoice_ID;
        this.Product_ID = Product_ID;
        this.Quantity = Quantity;
        this.Unit_Price = Unit_Price;
    }

    public int getInvoice_ID() {
        return Invoice_ID;
    }

    public void setInvoice_ID(int Invoice_ID) {
        this.Invoice_ID = Invoice_ID;
    }

    public int getProduct_ID() {
        return Product_ID;
    }

    public void setProduct_ID(int Product_ID) {
        this.Product_ID = Product_ID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getUnit_Price() {
        return Unit_Price;
    }

    public void setUnit_Price(int Unit_Price) {
        this.Unit_Price = Unit_Price;
    }
    
    
}
