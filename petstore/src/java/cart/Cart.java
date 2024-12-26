/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import db.OrderDetail;
import db.OrderHeader;
import db.OrderHeaderFacade;
import db.Product;
import db.ProductFacade;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Collection;
import java.util.Date;
import java.util.Hashtable;
import java.util.Map;

/**
 *
 * @author PHT
 */
public class Cart {
    private Map<Integer,Item> map = null;

    public Cart() {
        map = new Hashtable<>();
    }

    public Map<Integer, Item> getMap() {
        return map;
    }
    
    public void add(int id, int quantity) throws ClassNotFoundException, SQLException, ParseException{
        Item item = this.map.get(id);
        if(item == null){
            //neu item chua co trong cart them item moi vao cart
            ProductFacade pf = new ProductFacade();
            Product product = pf.select(id);
            item = new Item();
            item.setProduct(product);
            item.setQuantity(quantity);
            map.put(id, item);
        }else{
            //neu item da co trong cart thi chi tang so luong len quantity
            item.setQuantity(item.getQuantity()+quantity);
        }
    }
    
    public void remove(int id){
        this.map.remove(id);
    }
    
    public void update(int id, int newQuantity){
        Item item = map.get(id);
        item.setQuantity(newQuantity);
    }
    
    public void empty(){
        this.map.clear();
    }
       
    public Collection<Item> getItems(){
        return this.map.values();
    }
        
    public double getTotal(){
        double total = 0;
        for(Item item:this.map.values()){
            total += item.getCost();
        }
        return total;
    }
    
    public void checkout(int customerId) throws ClassNotFoundException, SQLException {
        Date date = new Date();
        int employeeId = 2;
        String status = "NEW";//NEW->SHIPPING->CANCEL,CLOSE
        OrderHeader oh = new OrderHeader(date, status, customerId, employeeId);

        for (Item item : this.getItems()) {
            OrderDetail od = new OrderDetail(item.getProduct().getId(), item.getQuantity(), item.getProduct().getPrice(), item.getProduct().getDiscount());
            oh.add(od);
        }

        OrderHeaderFacade ohf = new OrderHeaderFacade();
        ohf.insert(oh);
    }
}
