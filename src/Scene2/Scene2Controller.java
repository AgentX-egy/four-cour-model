/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Scene2;

import Scene2.*;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;
import onlineshop.FXMLDocumentController;

/**
 *
 * @author kerol
 */
public class Scene2Controller implements Initializable {
   
    
    @FXML
    private void handleExitButtonAction(ActionEvent event){
        System.exit(0);
    }
    
    @FXML
    private void GoToProfile(ActionEvent event){
    try {
            Parent root = FXMLLoader.load(getClass().getResource("/ProfileScene/profileScene.fxml"));
            Scene scene = new Scene(root);
            
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            // OR
//            Stage stageTheLabelBelongs = (Stage) label.getScene().getWindow();
            // these two of them return the same stage
            // Swap screen
            stage.setTitle("Profile");
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    private void GoToProducts(ActionEvent event){
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/Products/products.fxml"));
            Scene scene = new Scene(root);
            
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            // OR
//            Stage stageTheLabelBelongs = (Stage) label.getScene().getWindow();
            // these two of them return the same stage
            // Swap screen
            stage.setTitle("Profile");
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    private void GoToPurchases(ActionEvent event){
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/Purchases/purchases.fxml"));
            Scene scene = new Scene(root);
            
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            // OR
//            Stage stageTheLabelBelongs = (Stage) label.getScene().getWindow();
            // these two of them return the same stage
            // Swap screen
            stage.setTitle("Profile");
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
}
