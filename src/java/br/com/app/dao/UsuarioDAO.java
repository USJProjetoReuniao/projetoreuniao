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
import java.util.ArrayList;
/**
 *
 * @author luandre
 */
public class UsuarioDAO {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ArrayList<Usuario> lista = new ArrayList<>();
    private ResultSet rs;
   
    
    public UsuarioDAO() {    
      conn = new ConnectionDB().getConexao();
    }
    
    
    
     public void Inserir(Usuario usuario){
       // String sql ="INSERT INTO _reuniao (titulo,duracao,categoria,localizacao,ata,data,comentario_cod) VALUES (?,?,?,?,?,?,?)";
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
    
     public ArrayList <Usuario> Consultar(String nome, String senha){
           String sql = "SELECT * FROM _reuniao WHERE nome="+nome+" AND "+senha;
               try{
                    st = conn.createStatement();
                    rs = st.executeQuery(sql);

                    while(rs.next()){
                        
                         Usuario usuario = new Usuario();
                            usuario.setId(rs.getInt("id"));
                            usuario.setNome(rs.getString("nome"));
                            usuario.setSenha(rs.getString("senha"));
                            lista.add(usuario);
                            
                         }
                    } catch(SQLException error){
                       throw new RuntimeException("Erro 5: " +error);
                }       
        return lista;
            
           
      }
  
    
}
