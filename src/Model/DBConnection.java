package Model;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBConnection {

    private static DBConnection singleton = null;
    private Connection con;

    private DBConnection(String SQLHost, String SQLPortNum, String SQLName) {
        try {
            this.con = DriverManager.getConnection(
                    "jdbc:mysql://" + SQLHost + ":" + SQLPortNum + "/" + SQLName,
                    "zykerA", "1234");
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public static DBConnection createInstance(
            String SQLHost, String SQLPortNum, String SQLName) {
        DBConnection.singleton = new DBConnection(
                SQLHost, SQLPortNum, SQLName);
        return DBConnection.singleton;
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

    public int getUserID(String username, String password) {
        int result = -1;
        String query = "SELECT userID from users WHERE UserName Like ? AND Password Like ? ;";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("userID");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());;
        }
        return result;
    }

    public int getProductQuantity(int productID) {
        int result = -1;
        String sql = "SELECT quantity FROM products WHERE productID="
                + String.valueOf(productID);
        try (Statement stmt = this.con.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public int getUserPoints(int userID) {
        int result = -1;
        String sql = "SELECT points FROM Users WHERE userID="
                + String.valueOf(userID);
        try (Statement stmt = this.con.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public ResultSet viewAllProducts() {
        return sendSQL("SELECT * FROM products");
    }

    public ResultSet viewProductByID(int productID) {
        return sendSQL("SELECT * FROM products WHERE productID="
                + String.valueOf(productID));
    }

    public int insertPurchse(int userID, int points) {
        int result = -1;
        String sql = "INSERT INTO purchases (`userID`, `points`) "
                + "VALUES (" + String.valueOf(userID) + ","
                + String.valueOf(points) + ")";
        try (Statement stmt = this.con.createStatement()) {
            stmt.execute(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return result;
    }

    public void insertPurchaseDetail(int purchaseID, int productID, int quantity) {
        String sql = "INSERT INTO purchasedetails "
                + "(`purchaseID`,`productID`,`quantity`) "
                + "VALUES (" + purchaseID + "," + productID + "," + quantity + ")";
        try (Statement stmt = this.con.createStatement()){
            stmt.execute(sql);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}
