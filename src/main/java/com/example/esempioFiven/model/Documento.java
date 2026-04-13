package com.example.esempioFiven.model;

import java.util.Date;

import com.example.esempioFiven.util.StatiDocumento;

public class Documento {
	
	private Integer idDocumento;
	private String barcodeDocumento;
	private String tipoDocumento;
	private StatiDocumento statoDocumento; //sarà quindi di tipo enum (vedi in util)
	private Integer idMazzettaFK;
	private String percorsoFile;
	private Date dataScansione;
	private String note;
	private Integer idOperatoreFK;
	
	
	
	public Integer getIdDocumento() {
		return idDocumento;
	}
	
	public void setIdDocumento(Integer idDocumento) {
		this.idDocumento = idDocumento;
	}
	
	
	public String getBarcodeDocumento() {
		return barcodeDocumento;
	}
	
	public void setBarcodeDocumento(String barcodeDocumento) {
		this.barcodeDocumento = barcodeDocumento;
	}
	
	
	public String getTipoDocumento() {
		return tipoDocumento;
	}
	
	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	
	public StatiDocumento getStatoDocumento() {
		return statoDocumento;
	}

	public void setStatoDocumento(StatiDocumento statoDocumento) {
		this.statoDocumento = statoDocumento;
	}
	

	public Integer getIdMazzettaFK() {
		return idMazzettaFK;
	}

	public void setIdMazzettaFK(Integer idMazzettaFK) {
		this.idMazzettaFK = idMazzettaFK;
	}

	
	public String getPercorsoFile() {
		return percorsoFile;
	}

	public void setPercorsoFile(String percorsoFile) {
		this.percorsoFile = percorsoFile;
	}

	
	public Date getDataScansione() {
		return dataScansione;
	}

	public void setDataScansione(Date dataScansione) {
		this.dataScansione = dataScansione;
	}

	
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	
	public Integer getIdOperatoreFK() {
		return idOperatoreFK;
	}

	public void setIdOperatoreFK(Integer idOperatoreFK) {
		this.idOperatoreFK = idOperatoreFK;
	}	
}
