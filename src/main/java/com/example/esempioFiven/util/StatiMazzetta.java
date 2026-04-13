package com.example.esempioFiven.util;

public enum StatiMazzetta {
		IN_ATTESA("In Attesa"),
		IN_LAVORAZIONE("In Lavorazione"),
		SCANSIONATA("Scansionata"),
		COMPLETATA("Completata"),
		ANOMALA("Anomala");

		private final String LabelMazz;
		
		StatiMazzetta (String LabelMazz){
			this.LabelMazz=LabelMazz;
		}
		
		public String getLabelMazz() {
			return LabelMazz;
		}
}
