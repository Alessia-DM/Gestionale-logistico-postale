/**
 * JavaScript per controllare, in tempo reale, che il codice scatola che l'operatore sta inserendo non esista già
 */

document.addEventListener("DOMContentLoaded", function() {
    const inputBarcode = document.getElementById("codiceScatolaInput");
    const feedback = document.getElementById("barcode-feedback");
    const btnConferma = document.querySelector(".ricerca-btn");
    const prefisso = "SCAT";

    if (inputBarcode) {
        // Impostazione iniziale
        if (inputBarcode.value === "" || !inputBarcode.value.startsWith(prefisso)) {
            inputBarcode.value = prefisso;
        }

        inputBarcode.addEventListener("input", function() {
            let valore = this.value.toUpperCase();

            // 1. Assicurati che inizi sempre con SCAT
            if (!valore.startsWith(prefisso)) {
                // Se l'utente cancella tutto, ripristiniamo il prefisso
                this.value = prefisso;
                return;
            }

            // 2. Rimuovi eventuali duplicati di "SCAT" nella parte successiva
            // Isola la parte dopo il primo "SCAT" e puliscila
            let parteVariabile = valore.substring(prefisso.length).replace(/SCAT/g, "");
            this.value = prefisso + parteVariabile;
        });

        // Previene lo spostamento del cursore prima del prefisso
        inputBarcode.addEventListener("click", function() {
            if (this.selectionStart < prefisso.length) {
               this.setSelectionRange(prefisso.length, prefisso.length);
            }
        });
	
        inputBarcode.addEventListener("change", function() {
            const codice = this.value.trim();

            // Controllo: invia al server solo se il codice è lungo più del prefisso
            if (codice.length > prefisso.length) {
                fetch(`/api/scatole/check-codeScat?codice=${encodeURIComponent(codice)}`)
                    .then(response => response.json())
                    .then(exists => {
                        if (exists) {
                            inputBarcode.classList.add("is-invalid");
                            feedback.innerText = "Attenzione: questo codice scatola esiste già a sistema!";
                            feedback.style.display = "block";
                            btnConferma.disabled = true;
                        } else {
                            inputBarcode.classList.remove("is-invalid");
                            inputBarcode.classList.add("is-valid");
                            feedback.innerText = "";
                            btnConferma.disabled = false;
                        }
                    })
                    .catch(error => {
                        console.error("Errore validazione:", error);
                    });
            } else {
                // Reset se il campo è vuoto o contiene solo "SCAT"
                inputBarcode.classList.remove("is-invalid", "is-valid");
                feedback.innerText = "";
                btnConferma.disabled = false;
            }
        });
    }
});