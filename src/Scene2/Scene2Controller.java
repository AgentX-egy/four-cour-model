/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Scene2;

import Model.Orphans;
import Model.User;
import Scene2.*;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import onlineshop.FXMLDocumentController;

/**
 *
 * @author kerol
 */
public class Scene2Controller implements Initializable {
   
    
    @FXML
    private void SignOut(ActionEvent event)
    {
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/onlineshop/FXMLDocument.fxml"));
            Scene scene = new Scene(root);
            
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            // OR
//            Stage stageTheLabelBelongs = (Stage) label.getScene().getWindow();
            // these two of them return the same stage
            // Swap screen
            stage.setTitle("Sign in");
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(Scene2Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    private void GoToProfile(ActionEvent event){
    try {
            Parent root = FXMLLoader.load(getClass().getResource("/ProfileScene/profileScene.fxml"));
            Scene scene = new Scene(root);
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            stage.setTitle("Profile");
            ((TextField)scene.lookup("#Profile")).setText(User.getUser().getUsername());
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    Button btn;
    
    @FXML
    private void GoToOrphans(ActionEvent event){
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/OrphanScreen/orphans.fxml"));
            Scene scene = new Scene(root);
            
            ArrayList<Orphans> allOrphans = Model.Orphans.getAllOrphans();
            System.out.println(allOrphans.size());
            int row = 0;
            int col = 0;
            for(int i = 0; i < allOrphans.size();i++){
                if((i%2 == 0) && (i != 0) )
                {
                    row++;
                    col =0;
                }
                btn = new Button(allOrphans.get(i).getName());
                
                btn.setMinWidth((((GridPane)scene.lookup("#dynamicGrid")).getPrefWidth() - 5)/2 - 5);
                btn.setMinHeight(((GridPane)scene.lookup("#dynamicGrid")).getPrefHeight()/allOrphans.size());
                btn.setStyle("-fx-background-color: #cfeefb;-fx-font-size : 18px;-fx-text-fill:#e1056f;");
                
                btn.setAlignment(Pos.CENTER);
//                btn.autosize();
                
                ((GridPane)scene.lookup("#dynamicGrid")).add(btn, col++, row);
                ((GridPane)scene.lookup("#dynamicGrid")).autosize();
                ((GridPane)scene.lookup("#dynamicGrid")).setAlignment(Pos.CENTER);

            }
            
//            scene.getStylesheets().add(getClass().getResource("Products/buttonStyle.css").toExternalForm());
            
            
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            stage.setTitle("Profile");
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    private void GoToDonations(ActionEvent event){
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/DonationScreen/donations.fxml"));
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
