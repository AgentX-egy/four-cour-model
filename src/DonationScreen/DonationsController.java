/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DonationScreen;

import Model.DonationType;
import Model.DonationOption;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;


/**
 *
 * @author kerol
 */
public class DonationsController implements Initializable {
   
    ArrayList<DonationType> donationTypes;
    ArrayList<DonationOption> options;
    
    private Object findObjectFromString(String toFind, ArrayList inList){
        for (Object object : inList) {
            if (object.equals(toFind))
                return object;
        }
        return null;
    }
    
    @FXML
    private void handleExitButtonAction(ActionEvent event){
        System.exit(0);
    }
    
    @FXML
    private void GoBack(ActionEvent event) throws IOException{
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/Scene2/Scene2.fxml"));
            Scene scene = new Scene(root);
            
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            // OR
//            Stage stageTheLabelBelongs = (Stage) label.getScene().getWindow();
            // these two of them return the same stage
            // Swap screen
            stage.setTitle("Home");
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(DonationsController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    @FXML
    private void Donate(){

        try {
            Parent root = FXMLLoader.load(getClass().getResource("/Scene2/Scene2.fxml"));
            Scene scene = new Scene(root);
            //this make sure that only digits are accepted
            

               
        } catch (IOException ex) {
            Logger.getLogger(DonationsController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    private void ShowSecondCombo(String value){
        
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/Scene2/Scene2.fxml"));
            Scene scene = new Scene(root);
            
            int quantity = Integer.valueOf(((TextField)scene.lookup("quantity_txt")).getText());
            String DonationType = ((ComboBox)scene.lookup("don_ops")).getValue().toString();
            DonationType dt = (DonationType) findObjectFromString(DonationType, donationTypes);
            //Model.DonationType.makeDonation(dt.getDonationTypeID(), quantity);
            
//          ((ComboBox)scene.lookup("don_ops")).setItems();
            
        } catch (IOException ex) {
            Logger.getLogger(DonationsController.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/DonationScreen/donations.fxml"));
            Scene scene = new Scene(root);
            
            
            ((TextField)scene.lookup("quantity_txt")).textProperty().addListener(new ChangeListener<String>() {
                    @Override
                    public void changed(ObservableValue<? extends String> observable, String oldValue, 
                    String newValue) {
                    if (!newValue.matches("\\d*")) {
                    ((TextField)scene.lookup("quantity_txt")).setText(newValue.replaceAll("[^\\d]", ""));
                    }}});
            
            
            donationTypes = Model.DonationType.getAllDonationTypes();
            ((ComboBox)scene.lookup("don_type")).setItems((ObservableList) donationTypes);
            
            EventHandler handler = new EventHandler() {
                @Override
                public void handle(Event event) {
                    String valueS = ((ComboBox)scene.lookup("don_type")).getValue().toString();
                    DonationType d = (DonationType) findObjectFromString(valueS, donationTypes);
                    options = DonationType.getAllDonationOptions(d.getDonationTypeID());
                    ((ComboBox)scene.lookup("don_ops")).setItems((ObservableList) options);
                }
            };
            
            ((ComboBox)scene.lookup("don_type")).setOnAction(handler);
            
        } catch (IOException ex) {
            Logger.getLogger(DonationsController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }      
}
