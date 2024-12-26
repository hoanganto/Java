/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import db.Product;

/**
 *
 * @author PHT
 */
public class Item {
    private Product product;
    private int quantity;

    public Item() {
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getNewPrice() {
        return this.product.getNewPrice();
    }
    
    public double getCost() {
        return this.getNewPrice()*this.quantity;
    }
}
