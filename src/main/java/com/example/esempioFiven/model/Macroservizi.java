package com.example.esempioFiven.model;

import java.util.List;

public class Macroservizi {
	private Integer id;
	private String nomeMacros;
	private String descrizioneMacros;
	
	private List<Servizio> servizi;
	
	
	public Macroservizi() {
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getNome() {
		return nomeMacros;
	}


	public void setNome(String nomeMacros) {
		this.nomeMacros = nomeMacros;
	}


	public String getDescrizioneMacro() {
		return descrizioneMacros;
	}


	public void setDescrizioneMacro(String descrizioneMacros) {
		this.descrizioneMacros = descrizioneMacros;
	}


	public List<Servizio> getServizi() {
		return servizi;
	}

	public void setServizi(List<Servizio> servizi) {
		this.servizi = servizi;
	}
}
