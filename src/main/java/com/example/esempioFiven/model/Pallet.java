package com.example.esempioFiven.model;

import java.util.Date;
import java.util.List;

import jakarta.validation.constraints.NotBlank;

public class Pallet {
	private Integer idPallet;
	
	@NotBlank(message="Il codice del pallet è obbligatorio.")
	private String codicePallet;
	
	private Date dataCreazione;
	private Date dataArrivo;
	private Integer stato;
	private String statoDescrizione;
	private Integer idOperatoreFK;
	private String note;
	private Integer idSpedizioneFK;
	private Integer idDdtFK;
	
	private List<Scatola> scatolePallet;
	
	public Pallet() {
		
	}

	public Integer getIdPallet() {
		return idPallet;
	}

	public void setIdPallet(Integer idPallet) {
		this.idPallet = idPallet;
	}

	public String getCodicePallet() {
		return codicePallet;
	}

	public void setCodicePallet(String codicePallet) {
		this.codicePallet = codicePallet;
	}

	public Date getDataCreazione() {
		return dataCreazione;
	}

	public void setDataCreazione(Date dataCreazione) {
		this.dataCreazione = dataCreazione;
	}

	public Integer getStato() {
		return stato;
	}

	public void setStato(Integer stato) {
		this.stato = stato;
	}

	public String getStatoDescrizione() {
		return statoDescrizione;
	}

	public void setStatoDescrizione(String statoDescrizione) {
		this.statoDescrizione = statoDescrizione;
	}

	public Integer getIdOperatoreFK() {
		return idOperatoreFK;
	}

	public void setIdOperatoreFK(Integer idOperatoreFK) {
		this.idOperatoreFK = idOperatoreFK;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getIdSpedizioneFK() {
		return idSpedizioneFK;
	}

	public void setIdSpedizioneFK(Integer idSpedizioneFK) {
		this.idSpedizioneFK = idSpedizioneFK;
	}

	public List<Scatola> getScatolePallet() {
		return scatolePallet;
	}

	public void setScatolePallet(List<Scatola> scatolePallet) {
		this.scatolePallet = scatolePallet;
	}

	public Integer getIdDdtFK() {
		return idDdtFK;
	}

	public void setIdDdtFK(Integer idDdtFK) {
		this.idDdtFK = idDdtFK;
	}

	public Date getDataArrivo() {
		return dataArrivo;
	}

	public void setDataArrivo(Date dataArrivo) {
		this.dataArrivo = dataArrivo;
	}
	
	
	
}
