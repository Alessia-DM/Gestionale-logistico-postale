package com.example.esempioFiven.model;

import java.util.Date;

public class Anomalia {
	
	public enum TipoAnomalia{SCATOLA, MAZZETTA,DOCUMENTO}

	private Integer idAnomalia;
	private TipoAnomalia tipoRiferimento;
	private String codiceRiferimento;
	private String descrizioneErrore;
	private Date dataSegnalazione;
	private String operatoreSegnalazione;
	private int risolta;
	
	
	public Integer getIdAnomalia() {
		return idAnomalia;
	}
	
	public void setIdAnomalia(Integer idAnomalia) {
		this.idAnomalia = idAnomalia;
	}
	
	
	public TipoAnomalia getTipoRiferimento() {
		return tipoRiferimento;
	}
	
	public void setTipoRiferimento(TipoAnomalia tipoRiferimento) {
		this.tipoRiferimento = tipoRiferimento;
	}
	
	
	public String getCodiceRiferimento() {
		return codiceRiferimento;
	}
	
	public void setCodiceRiferimento(String codiceRiferimento) {
		this.codiceRiferimento = codiceRiferimento;
	}
	
	
	public String getDescrizioneErrore() {
		return descrizioneErrore;
	}
	
	public void setDescrizioneErrore(String descrizioneErrore) {
		this.descrizioneErrore = descrizioneErrore;
	}
	
	
	public Date getDataSegnalazione() {
		return dataSegnalazione;
	}
	
	public void setDataSegnalazione(Date dataSegnalazione) {
		this.dataSegnalazione = dataSegnalazione;
	}
	
	
	public String getOperatoreSegnalazione() {
		return operatoreSegnalazione;
	}
	
	public void setOperatoreSegnalazione(String operatoreSegnalazione) {
		this.operatoreSegnalazione = operatoreSegnalazione;
	}
	
	
	public int getRisolta() {
		return risolta;
	}
	
	public void setRisolta(int risolta) {
		this.risolta = risolta;
	}
	
}
