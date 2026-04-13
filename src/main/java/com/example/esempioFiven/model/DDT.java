package com.example.esempioFiven.model;

import java.util.Date;
import java.util.List;

import com.example.esempioFiven.util.StatiDdt;

public class DDT {
	
	private Integer idDdt;
	private Integer idSpedizioneFK;
	private String codiceDdt;
	private Integer idOperatoreFK;
	private Integer idClienteFK;
	private Date dataCreazione;
	private Date dataArrivo;
	private Integer numeroColliDichiarati;
	private String statoDdt;
	private String descrizione;
	private String noteVettore;
	private String vettoreDdt;
	
	private List<Scatola> scatole;
	private List<Pallet> pallet;
	
	public DDT() {
		
	}
	
	// Metodo di utilità: restituisce l'Enum partendo dalla stringa nel DB
    public StatiDdt getStatoEnum() {
        return StatiDdt.fromLabel(this.statoDdt);
    }
	
	public Integer getIdDdt() {
		return idDdt;
	}
	
	public void setIdDdt(Integer idDdt) {
		this.idDdt = idDdt;
	}
	
	
	public Integer getIdSpedizioneFK() {
		return idSpedizioneFK;
	}
	
	public void setIdSpedizioneFK(Integer idSpedizioneFK) {
		this.idSpedizioneFK = idSpedizioneFK;
	}
	
	
	public String getCodiceDdt() {
		return codiceDdt;
	}
	
	public void setCodiceDdt(String codiceDdt) {
		this.codiceDdt = codiceDdt;
	}
	
	
	public Integer getIdOperatoreFK() {
		return idOperatoreFK;
	}
	
	public void setIdOperatoreFK(Integer idOperatoreFK) {
		this.idOperatoreFK = idOperatoreFK;
	}
	
	
	public Integer getIdClienteFK() {
		return idClienteFK;
	}
	
	public void setIdClienteFK(Integer idClienteFK) {
		this.idClienteFK = idClienteFK;
	}
	
	
	public Date getDataCreazione() {
		return dataCreazione;
	}
	
	public void setDataCreazione(Date dataCreazione) {
		this.dataCreazione = dataCreazione;
	}
	
	
	public Date getDataArrivo() {
		return dataArrivo;
	}
	
	public void setDataArrivo(Date dataArrivo) {
		this.dataArrivo = dataArrivo;
	}
	
	
	public Integer getNumeroColliDichiarati() {
		return numeroColliDichiarati;
	}
	
	public void setNumeroColliDichiarati(Integer numeroColliDichiarati) {
		this.numeroColliDichiarati = numeroColliDichiarati;
	}
	
	
	public String getStatoDdt() {
		return statoDdt;
	}
	
	public void setStatoDdt(String statoDdt) {
		this.statoDdt = statoDdt;
	}
	
	
	public String getDescrizione() {
		return descrizione;
	}
	
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	
	public String getNoteVettore() {
		return noteVettore;
	}
	
	public void setNoteVettore(String noteVettore) {
		this.noteVettore = noteVettore;
	}
	
	
	public String getVettoreDdt() {
		return vettoreDdt;
	}
	
	public void setVettoreDdt(String vettoreDdt) {
		this.vettoreDdt = vettoreDdt;
	}

	
	public List<Scatola> getScatole() {
		return scatole;
	}

	public void setScatole(List<Scatola> scatole) {
		this.scatole = scatole;
	}

	public List<Pallet> getPallet() {
		return pallet;
	}

	public void setPallet(List<Pallet> pallet) {
		this.pallet = pallet;
	}
	
}
