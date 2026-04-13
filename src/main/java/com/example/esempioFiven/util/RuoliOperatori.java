package com.example.esempioFiven.util;

import java.util.List;

public class RuoliOperatori {

	//Elenco dei ruoli che possono assumere i vari operatori con accesso al sito
	public static final List<String> RUOLI =List.of(
			"System Admin",
			"Account Manager",
			"Responsabile di stabilimento",
			"Responsabile Logistico",
			"Back-Office Analyst",
			"Addetto materialità e archivi"
	);
	
	public static String getRuoloById(int profiloId) {
        if (profiloId >= 1 && profiloId <= RUOLI.size()) {
            return RUOLI.get(profiloId - 1); // -1 perché List parte da indice 0
        }
        return "ID operatore non valido";
    }
			
			
			
}
