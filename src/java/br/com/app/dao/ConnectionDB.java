/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.app.dao;

/**
 *
 * @author Luandre Bernardi
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    
    public Connection getConexao(){
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/reuniaoprojeto?serverTimezone=UTC","root","123456");
            
            
        }catch(ClassNotFoundException | SQLException error){
            throw new RuntimeException("Erro 1: "+error);
                   
                   
        }
                
    }
    
    
}
