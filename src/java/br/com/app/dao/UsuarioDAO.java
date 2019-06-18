/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.app.dao;
import br.com.app.model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author luandre
 */
public class UsuarioDAO {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
   
    
    public UsuarioDAO() {    
      conn = new ConnectionDB().getConexao();
    }
    
    
    
     public void Inserir(Usuario usuario){
     
            String sql ="INSERT INTO _reuniao (nome,senha,nivel) VALUES (?,?,?)";
        try{
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getSenha());
            stmt.setInt(3, usuario.getNivel());           
            stmt.execute();
            stmt.close();    
            
        }catch(SQLException error){
               throw new RuntimeException("Erro 2: " +error);
        }
       
    }
    
     public boolean Consultar(String nome, String senha) {
         boolean check = false; 
           String sql ="SELECT * FROM _usuario WHERE nome = ? AND senha = ?";
         
         try{
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, nome);
                    stmt.setString(2, senha);    
                    rs = stmt.executeQuery();
                      
                   if(rs.next()){
                  check = true;
                   } 
               }catch(SQLException error){
               throw new RuntimeException("Erro Função Login:" +error);           
              } finally{
             
         }                
          return check;
      }
  
    
}
