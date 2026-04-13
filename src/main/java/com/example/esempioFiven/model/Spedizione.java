package com.example.esempioFiven.model;

import java.util.Date;

import com.example.esempioFiven.util.StatiSpedizione;

public class Spedizione {
	
	private Integer idSpedizione;
	private String codiceSpedizione;
	private Integer idOperatoreFK;
	private Integer idClienteFK;
	private String vettore;
	private Date dataPartenza;
	private StatiSpedizione statoSpedizione;
	private String targa;
	private String destinazione;
	private Date dataArrivo;
	
	
	public Spedizione() {
		
	}
	
	public Integer getIdSpedizione() {
		return idSpedizione;
	}
	
	public void setIdSpedizione(Integer idSpedizione) {
		this.idSpedizione = idSpedizione;
	}

	
	public String getCodiceSpedizione() {
		return codiceSpedizione;
	}

	public void setCodiceSpedizione(String codiceSpedizione) {
		this.codiceSpedizione = codiceSpedizione;
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

	
	public String getVettore() {
		return vettore;
	}

	public void setVettore(String vettore) {
		this.vettore = vettore;
	}
	

	public Date getDataPartenza() {
		return dataPartenza;
	}

	public void setDataPartenza(Date dataPartenza) {
		this.dataPartenza = dataPartenza;
	}
	

	public StatiSpedizione getStatoSpedizione() {
		return statoSpedizione;
	}

	public void setStatoSpedizione(StatiSpedizione statoSpedizione) {
		this.statoSpedizione = statoSpedizione;
	}
	

	public String getTarga() {
		return targa;
	}

	public void setTarga(String targa) {
		this.targa = targa;
	}
	

	public String getDestinazione() {
		return destinazione;
	}

	public void setDestinazione(String destinazione) {
		this.destinazione = destinazione;
	}
	

	public Date getDataArrivo() {
		return dataArrivo;
	}

	public void setDataArrivo(Date dataArrivo) {
		this.dataArrivo = dataArrivo;
	}	
}
