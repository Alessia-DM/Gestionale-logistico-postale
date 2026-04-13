package com.example.esempioFiven.dto;

public class ProfiloUserDTO {
	private String codiceOperatore;
	private String username;
	private String descrizione;
	private String email;
	private String telFisso;
	private String telMobile;
	private String ruolo;
	private String collocazione;
	
	
	
	public ProfiloUserDTO(String codiceOperatore, String username, String descrizione, String email, String telFisso, String telMobile,
			String ruolo, String collocazione) {
		this.codiceOperatore=codiceOperatore;
		this.username = username;
		this.descrizione = descrizione;
		this.email = email;
		this.telFisso = telFisso;
		this.telMobile = telMobile;
		this.ruolo = ruolo;
		this.collocazione = collocazione;
	}

	

	public String getCodiceOperatore() {
		return codiceOperatore;
	}

	public void setCodiceOperatore(String codiceOperatore) {
		this.codiceOperatore = codiceOperatore;
	}

	public String getUsername() {
		return username;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public String getEmail() {
		return email;
	}

	public String getTelFisso() {
		return telFisso;
	}

	public String getTelMobile() {
		return telMobile;
	}

	public String getRuolo() {
		return ruolo;
	}

	public String getCollocazione() {
		return collocazione;
	}
}
