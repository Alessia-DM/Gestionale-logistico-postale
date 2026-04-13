package com.example.esempioFiven.dto;

import java.util.Date;


public class DocumentoDTO {

	private Integer idDocumento;
	private String barcodeDocumento;
	private String tipoDocumento;
	private String statoInt;
	private String statoLett;
	private Integer idMazzettaFK;
	private String percorsoFile;
	private Date dataScansione;
	private String note;
	private Integer idOperatoreFK;
	
	public DocumentoDTO() {
		
	}

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

	
	public String getStatoInt() {
		return statoInt;
	}

	public void setStatoInt(String statoInt) {
		this.statoInt = statoInt;
	}
	

	public String getStatoLett() {
		return statoLett;
	}

	public void setStatoLett(String statoLett) {
		this.statoLett = statoLett;
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
