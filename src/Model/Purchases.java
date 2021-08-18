/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Map;

/**
 *
 * @author Zezuh
 */
public class Purchases
{
private Map<Integer ,Products> cart;


 public int getTotal()
 {
     int T =0;
     for (Map.Entry<Integer ,Products> entry : cart.entrySet())
         T = entry.getValue().getPrice()*entry.getValue().getQuantity();
  
     return T;
     
 }
 
 }


