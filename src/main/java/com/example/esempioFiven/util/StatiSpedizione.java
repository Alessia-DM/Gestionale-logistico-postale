package com.example.esempioFiven.util;

public enum StatiSpedizione {
	IN_PREPARAZIONE("In Preparazione"),
	PRONTO_REGGIATURA("Pronto per Reggiatura"),
	PALLETTIZZATO("Pallettizzato"),
	ATTESA_DDT("In Attesa DDT"),
	SPEDITO("Spedito"),
	CONSEGNATO("Consegnato"),
	ANNULLATO("Annullato");
	
	private final String labelSped;

	StatiSpedizione(String labelSped){
		this.labelSped=labelSped;
	}
	
	public String getLabelSped() {
		return labelSped;
	}
}
