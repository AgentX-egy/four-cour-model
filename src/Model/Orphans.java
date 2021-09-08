package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Orphans {
    private int orphanID;
    private String name;
    private int age;
    private boolean isMale;

    public Orphans(int productID, String name, int price, boolean isMale) {
        this.orphanID = productID;
        this.name = name;
        this.age = price;
        this.isMale = isMale;
    }

    public int getOrphanID() {
        return orphanID;
    }
    
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }
    
    public static ArrayList<Orphans> getAllOrphans(){
        ResultSet rs = Orphans.viewAllOrphans();
        ArrayList<Orphans> productsList = new ArrayList<>();
        try {
            while (rs.next()) {
                productsList.add(new Orphans(rs.getInt(1),rs.getString(2),
                        rs.getInt(3),rs.getBoolean(4))
                );
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return productsList;
    }

    private static ResultSet viewAllOrphans() {
        return DBConnection.getInstance().sendSQL(
                "SELECT idorphan, name, age, gender FROM ag_project.orphan where Isdeleted=0;");
    }
}