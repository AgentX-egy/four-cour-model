package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

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

    public PreparedStatement prepareSQL(String sql) {
        try {
            return this.con.prepareStatement(sql);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

    public void InsertSQL(String sql) {
        try (Statement stmt = this.con.createStatement()) {
            stmt.execute(sql);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}