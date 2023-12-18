/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class OrderDeltail {

    private int order_id;
    private int product_id;
    private int unit_price;
    private int quantity;

    private Date order_date;
    String order_status;

    public OrderDeltail() {
    }

    public OrderDeltail(int order_id, int product_id, int unit_price, int quantity) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.unit_price = unit_price;
        this.quantity = quantity;
    }

    public OrderDeltail(int order_id, int product_id, int unit_price, int quantity, int category, String product_name) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.unit_price = unit_price;
        this.quantity = quantity;
    }

    public OrderDeltail(int product_id, Date order_date, int unit_price, int quantity, String order_status,int order_id) {
        this.product_id = product_id;
        this.order_date = order_date;
        this.unit_price = unit_price;
        this.quantity = quantity;
        this.order_status = order_status;
        this.order_id = order_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    @Override
    public String toString() {
        return   product_id + ", " + order_date.toString() +" "+ unit_price + " " + quantity + " "+ order_status;
    }

}
