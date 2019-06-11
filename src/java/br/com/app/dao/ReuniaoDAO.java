/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.app.dao;

import br.com.app.model.Reuniao;
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
public class ReuniaoDAO {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ArrayList<Reuniao> lista = new ArrayList<>();
    private ResultSet rs;
    private Boolean existe;
    
    public ReuniaoDAO(){   
        conn = new ConnectionDB().getConexao();
    }
    
    
    
    public void Inserir(Reuniao reuniao){
       // String sql ="INSERT INTO _reuniao (titulo,duracao,categoria,localizacao,ata,data,comentario_cod) VALUES (?,?,?,?,?,?,?)";
            String sql ="INSERT INTO _reuniao (titulo,duracao,categoria,localizacao,ata,data,cancelada) VALUES (?,?,?,?,?,?,?)";
        try{
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, reuniao.getTitulo());
            stmt.setString(2, reuniao.getDuracao());
            stmt.setString(3, reuniao.getCategoria());
            stmt.setString(4, reuniao.getLocalizacao());
            stmt.setString(5, reuniao.getAta());
            stmt.setString(6, reuniao.getData());
            stmt.setBoolean(7, reuniao.getCancelada());
            stmt.execute();
            stmt.close();
            
            
            
        }catch(SQLException error){
               throw new RuntimeException("Erro 2: " +error);
        }
       
    }
         
 
      public void alterar(Reuniao reuniao){
        String sql ="UPDATE _reuniao SET ata = ? WHERE id = ?";
        try{
            stmt=conn.prepareStatement(sql);
        //  stmt.setString(1, reuniao.getTitulo());
        //  stmt.setDouble(2, reuniao.getDuracao());
        //  stmt.setString(3, reuniao.getCategoria());
        //  stmt.setString(4, reuniao.getLocalizacao());
            stmt.setString(1, reuniao.getAta());
            stmt.setInt(2, reuniao.getId());
            
            stmt.execute();
            stmt.close();
        }catch(SQLException error){
               throw new RuntimeException("Erro 3: " +error);
        }
    }
      
      
      public void cancelar(int valor){
        String sql ="UPDATE _reuniao SET cancelada = true WHERE id ="+valor;
        try{
            stmt=conn.prepareStatement(sql);
            stmt.execute();
            stmt.close();
            
        }catch(SQLException error){
               throw new RuntimeException("Erro Cancelar: " +error);
        }
    }
      
       public void ativar(int valor){
        String sql ="UPDATE _reuniao SET cancelada = false WHERE id ="+valor;
        try{
            stmt=conn.prepareStatement(sql);
            stmt.execute();
            stmt.close();
            
        }catch(SQLException error){
               throw new RuntimeException("Erro Ativar: " +error);
        }
    }

      
      public void excluir(int valor){
        String sql ="DELETE FROM _reuniao WHERE id ="+valor;
        try{
            st=conn.createStatement();
            st.execute(sql);
            st.close();
            
        }catch(SQLException error){
               throw new RuntimeException("Erro 4: " +error);
        }
    }
     
      public ArrayList <Reuniao> visualizar(int valor){
           String sql = "SELECT * FROM _reuniao WHERE id="+valor;
               try{
                    st = conn.createStatement();
                    rs = st.executeQuery(sql);

                    while(rs.next()){
                        
                         Reuniao reuniao = new Reuniao();
                            reuniao.setId(rs.getInt("id"));
                            reuniao.setData(rs.getString("data"));
                            reuniao.setTitulo(rs.getString("titulo"));
                            reuniao.setDuracao(rs.getString("duracao"));
                            reuniao.setCategoria(rs.getString("categoria"));
                            reuniao.setLocalizacao(rs.getString("localizacao"));
                            reuniao.setAta(rs.getString("ata"));
                            reuniao.setCancelada(rs.getBoolean("cancelada"));
                            lista.add(reuniao);
                            
                         }
                    } catch(SQLException error){
                       throw new RuntimeException("Erro 5: " +error);
                }       
        return lista;
            
           
      }
      
        /*  public Boolean existe(int valor){
           String sql = "SELECT * FROM _reuniao WHERE id="+valor;
         
               try{
                    st=conn.createStatement();
                    rs = st.executeQuery(sql);
                   Reuniao reuniao = new Reuniao();
                    while(rs.next()){
                        if(reuniao.setId(rs.getInt("id"))){
                                         
                       }
                    
                    if(reuniao.getId()){
                        
                    }
                   
                    } catch(SQLException error){
                       throw new RuntimeException("Erro 5: " +error);
                }       
          return existe;
      }
      */
      
      public ArrayList<Reuniao> listarTodos(){
            String sql = "SELECT * FROM _reuniao order by id desc";
               try{
                    st = conn.createStatement();
                    rs = st.executeQuery(sql);

                    while(rs.next()){
                        Reuniao reuniao = new Reuniao();

                        reuniao.setId(rs.getInt("id"));
                        reuniao.setData(rs.getString("data"));
                        reuniao.setTitulo(rs.getString("titulo"));
                        reuniao.setDuracao(rs.getString("duracao"));
                        reuniao.setCategoria(rs.getString("categoria"));
                        reuniao.setLocalizacao(rs.getString("localizacao"));
                        reuniao.setAta(rs.getString("ata"));
                        reuniao.setCancelada(rs.getBoolean("cancelada"));
                        lista.add(reuniao);
                         }
                    } catch(SQLException error){
                       throw new RuntimeException("Erro 5: " +error);
                }
        return lista;
    }

   
}
