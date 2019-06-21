/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.app.model;

/**
 *
 * @author Luandre Bernardi
 */
public class Pauta {
     private int id;
     private int idreuniao;
     private String pauta;
     private String horario;
     private String comentario;

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getIdreuniao() {
        return idreuniao;
    }

    public void setIdreuniao(int idreuniao) {
        this.idreuniao = idreuniao;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }
    
     
     public int getIdReuniao() {
        return idreuniao;
    }

    public void setIdReuniao(int idreuniao) {
        this.idreuniao = idreuniao;
    }
  

    public String getPauta() {
        return pauta;
    }

    public void setPauta(String pauta) {
        this.pauta = pauta;
    }

   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   

}
