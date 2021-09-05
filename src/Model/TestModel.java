package Model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.Scanner;

/**
 *
 * @author star_
 */
public class TestModel {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        DBConnection.createInstance("41.237.128.248", "3306", "assignment2");
        String username = null;
        String password = null;
        int userID = -1;
        Scanner scanner = new Scanner(System.in);
        do {
            System.out.println("Enter Username: ");
            username = scanner.nextLine();
            System.out.println("Enter Password: ");
            password = scanner.nextLine();
            userID = DBConnection.getInstance().getUserID(username, password);
            if (userID == -1) {
                System.err.println("worng username and password try gain\n");
            }
        } while (userID == -1);

        for (Products p : Products.getAllProducts()) {
            System.out.println("ProductID: " + p.getProductID());
            System.out.println("ProductName: " + p.getName());
            System.out.println("ProductPrice: " + p.getPrice());
            System.out.println();
        }
        String input;
        Purchases p = new Purchases();
        while (true) {
            System.out.println("what would you like to buy?\n"
                    + "input the productID you wish to buy one at a time\n"
                    + "when you finish input kalas");
            input = scanner.nextLine();
            if(input.compareToIgnoreCase("kalas")==0) break;
            p.addToCart(Integer.parseInt(input));
        }
        p.pay(userID);
        System.out.println("Thank you for your patrionage!");
    }
}
