/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class ItemsInvoice {

    private int product_ID;
    private int quantity;
    private int unit_price;

    public ItemsInvoice() {
    }

    public ItemsInvoice(int product_ID, int quantity, int unit_price) {
        this.product_ID = product_ID;
        this.quantity = quantity;
        this.unit_price = unit_price;
    }

    public int getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(int product_ID) {
        this.product_ID = product_ID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }
    
    
}
