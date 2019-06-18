package br.com.app.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Luandre Bernardi
 */
public class ReuniaoErro {
    
    
   private static String info;
   private static Boolean ctrl = true; 

    public static Boolean getCtrl() {
        return ctrl;
    }

    public static void setCtrl(Boolean ctrl) {
        ReuniaoErro.ctrl = ctrl;
    }
        
    public static String getInfo() {
   
        return info;
    }

    public static void setInfo(String info) {
        ReuniaoErro.info = info;
    }

}
