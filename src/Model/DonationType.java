/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author star_
 */
public class DonationType {

    int donationTypeID;
    String donationType;
    String donationTypeUnit;

    public DonationType(int donationTypeID, String donationType, String donationTypeUnit) {
        this.donationTypeID = donationTypeID;
        this.donationType = donationType;
        this.donationTypeUnit = donationTypeUnit;
    }

    public static ArrayList<DonationType> getAllDonationTypes() {
        ResultSet rs = DonationType.viewAllDonationTypes();
        ArrayList<DonationType> donationTypesList = new ArrayList<>();
        try {
            while (rs.next()) {
                donationTypesList.add(new DonationType(
                        rs.getInt(1), rs.getString(2), rs.getString(3))
                );
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return donationTypesList;
    }

    public static ArrayList<DonationOption> getAllDonationOptions(int donationTypeID) {
        ResultSet rs = DonationType.viewAllDonationOptions(donationTypeID);
        ArrayList<DonationOption> donationOptionsList = new ArrayList<>();
        try {
            while (rs.next()) {
                donationOptionsList.add(new DonationOption(
                        rs.getInt(1), rs.getString(2)));
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
                + String.valueOf(value) + ");"
        );
    }

    private static ResultSet viewAllDonationTypes() {
        return DBConnection.getInstance().sendSQL(
                "SELECT iddonationtype,  donationtype, donationtypeunit "
                + "FROM donationtype where Isdeleted=0;");
    }

    private static ResultSet viewAllDonationOptions(int donationID) {
        return DBConnection.getInstance().sendSQL(
                "Select idoption, optionname "
                + "From donationtypeoption AS d,"
                + "donationoptions AS a "
                + "Where d.iddonationtype=" + String.valueOf(donationID)
                + "and d.idoption=a.iddonationoption and Isdeleted=0;");
    }

    public int getDonationTypeID() {
        return donationTypeID;
    }
    
    public boolean equals(String str) {
        return this.donationType.equals(str);
    } 
}
