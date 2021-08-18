package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;

public class DBConnection {
    private static DBConnection singleton = null;
    private Connection con;

    private DBConnection(String SQLHost, String SQLPortNum, String SQLName) {
        try {
            this.con = DriverManager.getConnection("jdbc:mysql://" + SQLHost + ":" + SQLPortNum + "/" + SQLName);
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public static DBConnection createInstance(String SQLHost, String SQLPortNum, String SQLName) {
        if (DBConnection.singleton == null) {
            DBConnection.singleton = new DBConnection(SQLHost, SQLPortNum, SQLName);
            return singleton;
        } else {
            return singleton;
        }
    }

    public static DBConnection getInstance() {
        if (DBConnection.singleton == null) {
            System.err.println("create an instance first");
            return null;
        } else {
            return DBConnection.singleton;
        }
    }

    public ResultSet sendSQL(String sql) {
        try {
            return this.con.createStatement().executeQuery(sql);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    public int getProductQuantity(int productID){
        int result = -1;
        String sql = "SELECT quantity FROM products WHERE productID="+ String.valueOf(productID);
        try (Statement stmt = this.con.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return result;
    }

    public ResultSet viewAllProducts() {
        return sendSQL("");
    }
}
