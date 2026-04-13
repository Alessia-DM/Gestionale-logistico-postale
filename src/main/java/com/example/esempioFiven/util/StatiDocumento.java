package com.example.esempioFiven.util;


public enum StatiDocumento {
	    INSERITO("Inserito"),
	    IN_PREPARAZIONE("In preparazione"),
	    VERIFICATO("Verificato"),
	    SCARTATO("Scartato"),
	    INDICIZZATO("Indicizzato"),
	    DA_SCANSIONARE("Da scansionare"),
		SCANSIONATO("Scansionato"),
		IN_REVISIONE("In revisione");
	
		private final String labelDoc;
		
		StatiDocumento (String labelDoc){
			this.labelDoc=labelDoc;
		}

		public String getLabelDoc() {
			return labelDoc;
		}
}
