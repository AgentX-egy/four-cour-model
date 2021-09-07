/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package onlineshop;

import Model.DBConnection;
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
import javafx.scene.control.TextField;
import javafx.stage.Stage;


/**
 *
 * @author kerol
 */
public class FXMLDocumentController implements Initializable {
   
    
  
   
    @FXML
    private void handleExitButtonAction(ActionEvent event){
        System.exit(0);
    }
    
    @FXML
    private void GotoRegister(ActionEvent event){
        try {
           
            Parent root = FXMLLoader.load(getClass().getResource("/RegisterScreen/register.fxml"));
//            Parent root = FXMLLoader.load(getClass().getResource("/Register/register.fxml"));
            Scene scene = new Scene(root);
            
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            stage.setTitle("Register");
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    private void GotoSecond(ActionEvent event) throws IOException{
        try {
            Parent root = FXMLLoader.load(getClass().getResource("/Scene2/Scene2.fxml"));
            Scene scene = new Scene(root);
            
            Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
            stage.setTitle("Home");
            stage.setScene(scene);
            
        } catch (IOException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    private void Login(ActionEvent event) throws IOException{
        
        Stage stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
        Scene parentScene = stage.getScene();
        String username = ((TextField)parentScene.lookup("#username_txt")).getText();
        String password = ((TextField)parentScene.lookup("#pass_txt")).getText();
        System.out.println(username);
        System.out.println(password);        
        DBConnection.createInstance("197.46.92.128", "3306", "assignment2");
        int id = DBConnection.getInstance().getUserID(username, password);
        
        
        
        
        if(id != -1){
            GotoSecond(event);
        }
        else{
            System.out.println("wrong username and password");
        }
        
        
    }
    
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
    }    
    
}
