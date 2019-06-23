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
public class Reuniao {
   
    private int id;
    private String titulo;
    private String data;
    private String horaInicial;  
    private String horaFinal;
    private String duracao;
    private String categoria;
    private String localizacao;
    private String ata;
    private Boolean cancelada;    
    private static String procurar ="";    
    
    public Reuniao() {
    }   
    
    
    public static String getProcurar() {
        return procurar;
    }

    public static void setProcurar(String procurar) {
        Reuniao.procurar = procurar;
    }      
       
    
    public Boolean getCancelada() {
        return cancelada;
    }

    public void setCancelada(Boolean cancelada) {
        this.cancelada = cancelada;
    }
     
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDuracao() {
        return duracao;
    }

    public void setDuracao(String duracao) {
        this.duracao = duracao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getAta() {
        return ata;
    }

    public void setAta(String ata) {
        this.ata = ata;
    }

    public String getData() {
        return data;
    }
    
       
    public void setData(String data) {
        this.data = data;
    }

   public String getHoraInicial() {
        return horaInicial;
    }

    public void setHoraInicial(String horaInicial) {
        this.horaInicial = horaInicial;
    }

    public String getHoraFinal() {
        return horaFinal;
    }

    public void setHoraFinal(String horaFinal) {
        this.horaFinal = horaFinal;
    }
    
 
}
