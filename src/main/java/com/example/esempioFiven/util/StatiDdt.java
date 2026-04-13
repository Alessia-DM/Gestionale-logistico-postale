package com.example.esempioFiven.util;

public enum StatiDdt {
	CREATO("Creato"),
	ATTESA("In Attesa"),
	IN_ARRIVO("In Arrivo"),
	IN_LAVORAZIONE("In Lavorazione"),
	IN_GIACENZA("In Giacenza"),
	CONSEGNATO("Consegnato"),
	ANNULLATO("Annullato");
	
	private final String labelDdt;
	
	StatiDdt (String labelDdt){
		this.labelDdt=labelDdt;
	}
	
	public String getLabelDdt() {
		return labelDdt;
	}
	
	// Metodo per la conversione inversa
    public static StatiDdt fromLabel(String label) {
        for (StatiDdt s : StatiDdt.values()) {
            if (s.labelDdt.equalsIgnoreCase(label)) {
                return s;
            }
        }
        return null; 
    }
			
}
