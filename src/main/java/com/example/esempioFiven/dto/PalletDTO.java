package com.example.esempioFiven.dto;

import com.example.esempioFiven.model.Pallet;

public class PalletDTO extends Pallet {

	private String nomeOperatore;
	private String codiceDdtVisualizzato;
	

	public String getNomeOperatore() {
		return nomeOperatore;
	}

	public void setNomeOperatore(String nomeOperatore) {
        if (nomeOperatore != null && nomeOperatore.contains("-")) {
            this.nomeOperatore = nomeOperatore.split("-")[1].trim();
        } else {
            this.nomeOperatore = nomeOperatore;
        }
    }

	public String getCodiceDdtVisualizzato() {
		return codiceDdtVisualizzato;
	}

	public void setCodiceDdtVisualizzato(String codiceDdtVisualizzato) {
		this.codiceDdtVisualizzato = codiceDdtVisualizzato;
	}
	

}
