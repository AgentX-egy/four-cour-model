/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author star_
 */
public class Donation {

    int donationTypeID;
    String donationType;
    String donationTypeUnit;

    public Donation(int donationTypeID, String donationType, String donationTypeUnit) {
        this.donationTypeID = donationTypeID;
        this.donationType = donationType;
        this.donationTypeUnit = donationTypeUnit;
    }

    public static ArrayList<Donation> getAllDonationTypes() {
        ResultSet rs = Donation.viewAllDonationTypes();
        ArrayList<Donation> donationTypesList = new ArrayList<>();
        try {
            while (rs.next()) {
                donationTypesList.add(new Donation(
                        rs.getInt(1), rs.getString(2), rs.getString(3))
                );
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return donationTypesList;
    }

    public static HashMap<Integer,String> getAllDonationOptions(int donationTypeID) {
        ResultSet rs = Donation.viewAllDonationOptions(donationTypeID); 
//error with the sql should get idoption and its value from another table using left join but I don't rememebr how to do it
        HashMap<Integer,String> donationOptionsList = new HashMap<>();
        try {
            while (rs.next()) {
                donationOptionsList.put(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return donationOptionsList;
    }

    public static void makeDonation(int donationOption, int value) {
        DBConnection.getInstance().InsertSQL(
                "INSERT INTO `donation` (`iduser`, `iddonationoption`, `value`) VALUES ("
                + String.valueOf(User.getUser().getuserID()) + ", "
                + String.valueOf(donationOption) + ", "
                + String.valueOf(value) + ";"
        );
    }

    private static ResultSet viewAllDonationTypes() {
        return DBConnection.getInstance().sendSQL(
                "SELECT iddonationtype,  donationtype, donationtypeunit FROM donationtype where Isdeleted=0;");
    }

    private static ResultSet viewAllDonationOptions(int donationID) {
        return DBConnection.getInstance().sendSQL(
                "SELECT idoption FROM donationtypeoption where iddonationtype="
                + String.valueOf(donationID) + " and Isdeleted=0;");
    }
}
