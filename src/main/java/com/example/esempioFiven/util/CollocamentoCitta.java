package com.example.esempioFiven.util;


import java.util.List;

public class CollocamentoCitta {

    // Lista fissa delle città, ordinata in base al numero
    public static final List<String> CITTA = List.of(
        "Milano",  // 1
        "Roma",    // 2
        "Napoli",  // 3
        "Torino",   // 4
        "Bologna",	//5
        "Genova",	//6
        "Palermo",	//7
        "Cagliari",	//8
        "Perugia",	//9
        "Bari",	//10
        "L'Aquila",	//11
        "Potenza",	//12
        "Catanzaro", //13
        "Trieste", 	//14
        "Venezia",	//15
        "Aosta",	//16
        "Trento", 	//17
        "Firenze", //18
        "Campobasso", //19
        "Ancona"	//20
    );

    // Metodo per ottenere la città dal numero
    public static String getCittaById(int centroDematId) {
        if (centroDematId >= 1 && centroDematId <= CITTA.size()) {
            return CITTA.get(centroDematId - 1); // -1 perché List parte da indice 0
        }
        return "ID città non valido";
    }
}
