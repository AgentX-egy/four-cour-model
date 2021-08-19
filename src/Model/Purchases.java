package Model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zezuh
 */
public class Purchases {

    private final HashMap<Integer, Products> cart;

    public Purchases() {
        this.cart = new HashMap<>();
    }
    
    public void addToCart(int productID) {
        if (cart.containsKey(productID)) {
            cart.get(productID).quantityUp();
        } else {
            Products realProduct = Products.getProductByID(productID);
            if (realProduct != null) {
                cart.put(productID, realProduct);
            }
        }
    }

    public int getTotalPrice() {
        int total = 0;
        for (Map.Entry<Integer, Products> entry : cart.entrySet()) {
            total += entry.getValue().getPrice() * entry.getValue().getQuantity();
        }
        return total;
    }

    public int viewCartPoints() {
        return getTotalPrice() / 100;
    }

    public void pay(int userID) {
        int purchaseID = DBConnection.getInstance().insertPurchse(userID, this.viewCartPoints());
        cart.entrySet().forEach((entry) -> {
            DBConnection.getInstance().insertPurchaseDetail(
                    purchaseID, 
                    entry.getValue().getProductID(), 
                    entry.getValue().getQuantity());
        });
    }
}
