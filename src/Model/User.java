package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Zezuh
 */
public class User {

    private static User singleton = null;
    private final int userid;
    private final String username;
    private final boolean isMale;
    private final boolean isMarried;

    private User(int userid, String username, boolean isMale, boolean isMarried) {
        this.userid = userid;
        this.username = username;
        this.isMale = isMale;
        this.isMarried = isMarried;
    }

    public static void createUser(String username, String password) {
        int result = -1;
        String query = 
            "SELECT iduser, username, isMale, isMarried from user WHERE UserName Like ? AND Password Like ?";
        try {
            PreparedStatement ps = DBConnection.getInstance().prepareSQL(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                singleton = new User(
                        rs.getInt(1),rs.getString(2),
                        rs.getBoolean(3), rs.getBoolean(4)
                );
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    
    }
    
    public static User getUser() {
        return singleton;
    }

    public String getUsername() {
        return this.username;
    }

    int getuserID() {
        return this.userid;
    }
}
