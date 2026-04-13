document.addEventListener('DOMContentLoaded', function() {
    // prende il form della pagina
    const form = document.querySelector('form');
    if (!form) return;

    // salva lo stato iniziale del form al momento del caricamento
	const initialValues = {};
	['email','telFisso','telMobile'].forEach(id => {
		const input=document.getElementById(id);
		if(input) initialValues[id] = input.value;
	});

    // funzione che verifica se il form è stato modificato rispetto allo stato iniziale
    function formChanged() {
		return ['email', 'telFisso', 'telMobile'].some(id => {
		            const input = document.getElementById(id);
		            return input && input.value !== initialValues[id];
		        });
    }

    // Funzione globale per il pulsante Indietro
    window.confirmExit = function() {
        if (formChanged()) {
            const leave = confirm("Hai modifiche non salvate. Vuoi uscire senza salvare?");
            if (leave) {
                window.location.href = '/profilo';
            }
        } else {
            window.location.href = '/profilo';
        }
    };
});
