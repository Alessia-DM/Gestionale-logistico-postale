package com.example.esempioFiven.model;

import java.util.List;

public class ClientePrivato {

	private Integer idPrivato;
	private String nome;
	private String cognome;
	private String codiceFiscale;
	private String email;
	private Integer idScatolaFK;
	private Integer idSpedizioneFK;
	private Integer idDdtFK;
	
	private List<DDT> ddtPrivato;
	private List<Spedizione> spedizioniPrivato;
	private List<Scatola> scatolePrivato;
	
	
	public ClientePrivato() {
	}


	public Integer getIdPrivato() {
		return idPrivato;
	}

	public void setIdPrivato(Integer idPrivato) {
		this.idPrivato = idPrivato;
	}


	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}


	public String getCodiceFiscale() {
		return codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public Integer getIdScatolaFK() {
		return idScatolaFK;
	}

	public void setIdScatolaFK(Integer idScatolaFK) {
		this.idScatolaFK = idScatolaFK;
	}


	public Integer getIdSpedizioneFK() {
		return idSpedizioneFK;
	}

	public void setIdSpedizioneFK(Integer idSpedizioneFK) {
		this.idSpedizioneFK = idSpedizioneFK;
	}


	public Integer getIdDdtFK() {
		return idDdtFK;
	}

	public void setIdDdtFK(Integer idDdtFK) {
		this.idDdtFK = idDdtFK;
	}


	public List<DDT> getDdtPrivato() {
		return ddtPrivato;
	}

	public void setDdtPrivato(List<DDT> ddtPrivato) {
		this.ddtPrivato = ddtPrivato;
	}


	public List<Spedizione> getSpedizioniPrivato() {
		return spedizioniPrivato;
	}

	public void setSpedizioniPrivato(List<Spedizione> spedizioniPrivato) {
		this.spedizioniPrivato = spedizioniPrivato;
	}


	public List<Scatola> getScatolePrivato() {
		return scatolePrivato;
	}

	public void setScatolePrivato(List<Scatola> scatolePrivato) {
		this.scatolePrivato = scatolePrivato;
	}
}
