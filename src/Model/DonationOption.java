/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author star_
 */
public class DonationOption {
    private final int donatonOptionID;
    private final String optionName;

    DonationOption(int optionID, String optionName) {
        this.donatonOptionID = optionID;
        this.optionName = optionName;
    }

    public int getDonatonOptionID() {
        return donatonOptionID;
    }

    public String getOptionName() {
        return optionName;
    }
    
    public boolean equals(String str) {
        return this.optionName.equals(str);
    }
}
