/**
 * Per rendere il filtro che seleziona lo stato simile agli altri bottoni
 */

document.addEventListener('DOMContentLoaded', function() {
    const selectFiltri = document.querySelectorAll('.btn-select-custom');

    selectFiltri.forEach(select => {
        // 1. Rimuove il focus dopo il click per eliminare il doppio bordo
        select.addEventListener('change', function() {
            this.blur(); 
        });

        // 2. Opzionale: Se vuoi che diventi blu istantaneamente prima del ricaricamento
        select.addEventListener('input', function() {
             if (this.value !== "") {
                this.classList.add('selezionato');
            }
        });
    });
});