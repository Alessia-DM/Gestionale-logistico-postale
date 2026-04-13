/**
 * File JS che si occupa dell'autofocus sulla casella del codice scatola e 
 * dell'apertura di un form "annidato" quando viene selezionato il cliente privato.
 */

document.addEventListener("DOMContentLoaded", function() {
    const inputBarcode = document.getElementById("codiceScatolaInput") || document.getElementById("codiceDdtInput");
    const selectCliente = document.getElementById("selectCliente");
    const sezionePrivato = document.getElementById("sezionePrivato");
   
    // Verifichiamo che la sezione esista prima di cercare gli input al suo interno
    const campiPrivato = sezionePrivato ? sezionePrivato.querySelectorAll("input") : [];
		
    // 1. Focus Automatico
    // Questo assicura che il cursore torni sempre sul campo barcode 
    // ogni volta che la pagina viene caricata o ricaricata dopo un errore
    if (inputBarcode) {
        inputBarcode.focus();
    }

    // 2. Logica Cliente Privato
    if (selectCliente && sezionePrivato) {
        selectCliente.addEventListener("change", function() {
            // Ricalcoliamo i campi nel caso la struttura fosse dinamica
            const currentCampi = sezionePrivato.querySelectorAll("input");
            
            if (this.value === "0") {
                sezionePrivato.classList.remove("sezione-nascosta");
				  
                currentCampi.forEach(c => {
                    if (c.id !== "email") c.required = true;
                });
            } else {
                // Aggiungiamo la classe CSS per nasconderla
                sezionePrivato.classList.add("sezione-nascosta");
               
                currentCampi.forEach(c => {
                    c.required = false;
                    c.value = ""; 
                });
            }
        });

        // Opzionale: attiva il controllo al caricamento pagina 
        // (utile se l'utente torna indietro dopo un errore)
        if (selectCliente.value === "0") {
            selectCliente.dispatchEvent(new Event('change'));
        }
    }
});