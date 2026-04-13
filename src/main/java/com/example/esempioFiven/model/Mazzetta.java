package com.example.esempioFiven.model;

import java.util.List;

import com.example.esempioFiven.util.StatiMazzetta;

public class Mazzetta {
	private Integer idMazzetta;
	private String codiceMazzetta;
	private Integer posizione;
	private Integer numeroDocumenti;
	private Integer  idScatolaFK;
	private StatiMazzetta stato;
	
	private List<Documento> documenti;
	
	public Mazzetta(){
		
	}
	
	public Mazzetta(String codiceMazzetta, Integer posizione, Integer numeroDocumenti,
			Integer idScatolaFK, StatiMazzetta stato) {
		this.codiceMazzetta = codiceMazzetta;
		this.posizione = posizione;
		this.numeroDocumenti = numeroDocumenti;
		this.idScatolaFK = idScatolaFK;
		this.stato=stato;
	}

	public Integer getIdMazzetta() {
		return idMazzetta;
	}

	public void setIdMazzetta(Integer idMazzetta) {
		this.idMazzetta = idMazzetta;
	}

	public String getCodiceMazzetta() {
		return codiceMazzetta;
	}

	public void setCodiceMazzetta(String codiceMazzetta) {
		this.codiceMazzetta = codiceMazzetta;
	}

	public Integer getPosizione() {
		return posizione;
	}

	public void setPosizione(Integer posizione) {
		this.posizione = posizione;
	}

	public Integer getNumeroDocumenti() {
		return numeroDocumenti;
	}

	public void setNumeroDocumenti(Integer numeroDocumenti) {
		this.numeroDocumenti = numeroDocumenti;
	}

	public Integer getIdScatolaFK() {
		return idScatolaFK;
	}

	public void setIdScatolaFK(Integer idScatolaFK) {
		this.idScatolaFK = idScatolaFK;
	}

	public StatiMazzetta getStato() {
		return stato;
	}

	public void setStato(StatiMazzetta stato) {
		this.stato = stato;
	}
	

	public List<Documento> getDocumenti() {
		return documenti;
	}

	public void setDocumenti(List<Documento> documenti) {
		this.documenti = documenti;
	}
	
	
}
