package com.example.esempioFiven.model;

import java.util.List;

public class Cliente {

	private Integer idCliente;
	private String codiceCliente;
	private String ragioneSociale;
	private String partitaIva;
	private String descrizioneCliente;
	
	private List<DDT> ddt;
	private List<Spedizione> spedizioni;
	private List<Scatola> scatole;

	public Cliente() {
		super();
	}

	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	public String getCodiceCliente() {
		return codiceCliente;
	}

	public void setCodiceCliente(String codiceCliente) {
		this.codiceCliente = codiceCliente;
	}

	public String getDescrizioneCliente() {
		return descrizioneCliente;
	}

	public void setDescrizioneCliente(String descrizioneCliente) {
		this.descrizioneCliente = descrizioneCliente;
	}

	public String getRagioneSociale() {
		return ragioneSociale;
	}

	public void setRagioneSociale(String ragioneSociale) {
		this.ragioneSociale = ragioneSociale;
	}

	public String getPartitaIva() {
		return partitaIva;
	}

	public void setPartitaIva(String partitaIva) {
		this.partitaIva = partitaIva;
	}

	public List<DDT> getDdt() {
		return ddt;
	}

	public void setDdt(List<DDT> ddt) {
		this.ddt = ddt;
	}

	
	public List<Spedizione> getSpedizioni() {
		return spedizioni;
	}

	public void setSpedizioni(List<Spedizione> spedizioni) {
		this.spedizioni = spedizioni;
	}

	
	public List<Scatola> getScatole() {
		return scatole;
	}

	public void setScatole(List<Scatola> scatole) {
		this.scatole = scatole;
	}	
	
	
}
