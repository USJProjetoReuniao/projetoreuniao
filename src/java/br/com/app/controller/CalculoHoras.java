/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.app.controller;

import java.text.DecimalFormat;

/**
 *
 * @author Luandre Bernardi
 */
public class CalculoHoras {
    private int minuto = 0;
    
    public CalculoHoras() {
	this.minuto = 0;
}

public CalculoHoras(String horas) {
	String[] hrs = horas.split(":");
	this.minuto = (Integer.parseInt(hrs[0]) * 60)
			+ (Integer.parseInt(hrs[1]));
}

public void setHoras(String horas) {
	String[] hrs = horas.split(":");
	this.minuto = (Integer.parseInt(hrs[0]) * 60)
			+ (Integer.parseInt(hrs[1]));
}

public void Zera() {
	this.minuto = 0;
}

public void Adicionar(String horas) {
	String[] hrs = horas.split(":");
	minuto += (Integer.parseInt(hrs[0]) * 60) + (Integer.parseInt(hrs[1]));
}

public void Subtrair(String horas) {
	String[] hrs = horas.split(":");
	minuto -= (Integer.parseInt(hrs[0]) * 60) + (Integer.parseInt(hrs[1]));
}

public String getHoras() {
	String horas;
	DecimalFormat fmt = new DecimalFormat("00");
	horas = Integer.toString(this.minuto / 60);
	horas += ":";
	horas += fmt.format(this.minuto % 60);
	return horas;
}
}
