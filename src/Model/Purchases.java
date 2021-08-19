/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Map;

/**
 *
 * @author Zezuh
 */
public class Purchases {

    private Map<Integer, Products> cart;

    public void addToCart(int productID) {
        if (cart.containsKey(productID)) {
            cart.get(productID).quantityUp();
        } else {
            cart.put(productID, Products.getProductByID(productID));
        }
    }

    public int getTotalPrice() {
        int total = 0;
        for (Map.Entry<Integer, Products> entry : cart.entrySet()) {
            total = entry.getValue().getPrice() * entry.getValue().getQuantity();
        }
        return total;
    }
    
    public int viewCartPoints() {
        return getTotalPrice() / 100;
    }
    
    public void pay(){
        
    }
}
