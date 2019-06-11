/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.app.dao;


import br.com.app.model.Pauta;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Luandre Bernardi
 */
public class PautaDAO {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
   
    private ArrayList<Pauta> lista = new ArrayList<>();
    
     public PautaDAO(){
   
        conn = new ConnectionDB().getConexao();
    }
    
     
    public void inserir(Pauta pauta){
        String sql ="INSERT INTO _pauta (pauta,id_reuniao,horario) VALUES (?,?,?)";
        try{
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, pauta.getPauta()); 
            stmt.setInt(2,pauta.getIdReuniao());
            stmt.setString(3,pauta.getHorario());            
            stmt.execute();
            stmt.close();
        }catch(SQLException error){
               throw new RuntimeException("Erro na Função Inserir Pauta: " +error);
        }       
    }
    
    public void excluir(int valor){
        String sql ="DELETE FROM _pauta WHERE id="+valor;
        try{
            st=conn.createStatement();
            st.execute(sql);
            st.close();
            
        }catch(SQLException error){
               throw new RuntimeException("Erro 4: " +error);
        }
    }
    
     public void excluirTodas(int valor){
        String sql ="DELETE FROM _pauta WHERE id_reuniao="+valor;
        try{
            st=conn.createStatement();
            st.execute(sql);
            st.close();
            
        }catch(SQLException error){
               throw new RuntimeException("Erro 4: " +error);
        }
    }
    
      public ArrayList<Pauta> listarTodas(int valor){
            String sql = "SELECT * FROM _pauta WHERE id_reuniao="+valor;
               try{
                    st = conn.createStatement();
                    rs = st.executeQuery(sql);

                    while(rs.next()){
                        Pauta comentario = new Pauta();
                        comentario.setId(rs.getInt("id"));
                        comentario.setPauta(rs.getString("pauta"));
                        comentario.setHorario(rs.getString("horario"));
                        lista.add(comentario);
                         }
                    } catch(SQLException error){
                       throw new RuntimeException("Erro na Função Listar Todos: " +error);
                }
        return lista;
    }
}
