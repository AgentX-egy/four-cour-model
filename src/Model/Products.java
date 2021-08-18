package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Products {
    private int productID;
    private String name;
    private int price;
    private int quantity = 1;

    public Products(int productID, String name, int price) {
        this.productID = productID;
        this.name = name;
        this.price = price;
    }

    public int checkStock() {
        return DBConnection.getInstance().getProductQuantity(this.productID);
    }

    public int getProductID() {
        return productID;
    }
    
    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }
    
    public static ArrayList<Products> getAllProducts(){
        ResultSet rs = DBConnection.getInstance().viewAllProducts();
        ArrayList<Products> productsList = new ArrayList<>();
        try {
            while (rs.next()) {
                productsList.add(
                        new Products(rs.getInt(1),rs.getString(2),rs.getInt(3))
                );
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return productsList;
    }
}