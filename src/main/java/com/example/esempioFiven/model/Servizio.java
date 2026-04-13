package com.example.esempioFiven.model;


public class Servizio {
	private Integer id;
	private String nomeServizio;
	private Integer macroservizioId;
	
	public Servizio() {
		
	}
	
	public Servizio(Integer id, String nomeServizio, Integer macroservizioId) {
		this.id = id;
		this.nomeServizio = nomeServizio;
		this.macroservizioId = macroservizioId;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getMacroservizioId() {
		return macroservizioId;
	}


	public void setMacroservizioId(Integer macroservizioId) {
		this.macroservizioId = macroservizioId;
	}


	public String getNomeServizio() {
		return nomeServizio;
	}


	public void setNomeServizio(String nomeServizio) {
		this.nomeServizio = nomeServizio;
	}
}
