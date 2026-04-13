package com.example.esempioFiven.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;


public class Scatola {
	private Integer idScatola;
	
	@NotBlank(message="Il codice scatola è obbligatorio.")
	private String codiceScatola;
	
	@NotNull(message="Selezionare un documento di trasporto.")
	private Integer idDdtFK;
	
	private Integer idOperatoreFK;
	private String tipologia;
	private Integer stato;
	private String statoDescrizione;
	private Integer idClienteFK;
	private Integer idSpedizioneFK;	
	private Date dataCreazione;	
	private Integer idPalletFK;
	private String nomeOperatore;
	
	
	private List<Mazzetta> mazzette = new ArrayList<>(); 
	
	public Scatola() {
		
	}
	
	public Integer getIdScatola() {
		return idScatola;
	}
	
	public void setIdScatola(Integer idScatola) {
		this.idScatola = idScatola;
	}
	
	
	public String getCodiceScatola() {
		return codiceScatola;
	}
	
	public void setCodiceScatola(String codiceScatola) {
		this.codiceScatola = codiceScatola;
	}
	
	
	public Integer getIdDdtFK() {
		return idDdtFK;
	}

	public void setIdDdtFK(Integer idDdtFK) {
		this.idDdtFK = idDdtFK;
	}

	
	public Integer getIdOperatoreFK() {
		return idOperatoreFK;
	}

	public void setIdOperatoreFK(Integer idOperatoreFK) {
		this.idOperatoreFK = idOperatoreFK;
	}

	
	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
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
	

	public Integer getIdClienteFK() {
		return idClienteFK;
	}

	public void setIdClienteFK(Integer idClienteFK) {
		this.idClienteFK = idClienteFK;
	}
	

	public Integer getIdSpedizioneFK() {
		return idSpedizioneFK;
	}

	public void setIdSpedizioneFK(Integer idSpedizioneFK) {
		this.idSpedizioneFK = idSpedizioneFK;
	}
	

	public Date getDataCreazione() {
		return dataCreazione;
	}

	public void setDataCreazione(Date dataCreazione) {
		this.dataCreazione = dataCreazione;
	}

	
	public List<Mazzetta> getMazzette() {
		return mazzette != null ? mazzette : new ArrayList<>();
    }
	
	public void setMazzette(List<Mazzetta> mazzette) {
		this.mazzette = mazzette;
	}

	public Integer getIdPalletFK() {
		return idPalletFK;
	}

	public void setIdPalletFK(Integer idPalletFK) {
		this.idPalletFK = idPalletFK;
	}

	public String getNomeOperatore() {
		return nomeOperatore;
	}

	public void setNomeOperatore(String nomeOperatore) {
		this.nomeOperatore = nomeOperatore;
	}	

	public Integer getNumeroMazzette() {
	    return (this.mazzette != null) ? this.mazzette.size() : 0;
	}
}
