/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Supplier {

    private int supplier_id;
    private String supplier_Name;
    private String supplier_Address;
    private String supplier_phone;
    private String supplier_Email;
    private boolean supplier_Status;

    public Supplier() {
    }

    public Supplier(int supplier_id, String supplier_Name, String supplier_Address, String supplier_phone, String supplier_Email, boolean supplier_Status) {
        this.supplier_id = supplier_id;
        this.supplier_Name = supplier_Name;
        this.supplier_Address = supplier_Address;
        this.supplier_phone = supplier_phone;
        this.supplier_Email = supplier_Email;
        this.supplier_Status = supplier_Status;
    }
      public Supplier(String supplier_Name, String supplier_Address, String supplier_phone, String supplier_Email, boolean supplier_Status) {
        this.supplier_Name = supplier_Name;
        this.supplier_Address = supplier_Address;
        this.supplier_phone = supplier_phone;
        this.supplier_Email = supplier_Email;
        this.supplier_Status = supplier_Status;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public String getSupplier_Name() {
        return supplier_Name;
    }

    public void setSupplier_Name(String supplier_Name) {
        this.supplier_Name = supplier_Name;
    }

    public String getSupplier_Address() {
        return supplier_Address;
    }

    public void setSupplier_Address(String supplier_Address) {
        this.supplier_Address = supplier_Address;
    }

    public String getSupplier_phone() {
        return supplier_phone;
    }

    public void setSupplier_phone(String supplier_phone) {
        this.supplier_phone = supplier_phone;
    }

    public String getSupplier_Email() {
        return supplier_Email;
    }

    public void setSupplier_Email(String supplier_Email) {
        this.supplier_Email = supplier_Email;
    }

    public boolean isSupplier_Status() {
        return supplier_Status;
    }

    public void setSupplier_Status(boolean supplier_Status) {
        this.supplier_Status = supplier_Status;
    }

     public String toString() {
        return   supplier_Name + ", " + supplier_Address.toString() +" "+ supplier_phone + " " + supplier_Email + " "+ supplier_Status;
    }

}
