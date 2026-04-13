let scatoleSelezionate = []; // Array di oggetti {id, codice, mazzette}
let modalBootstrap;

document.addEventListener("DOMContentLoaded", function () {
    modalBootstrap = new bootstrap.Modal(document.getElementById('modalConfermaPallet'));

    // 1. RIMOSSA STAMPA AUTOMATICA (L'utente cliccherà sulla stampante nel registro)
    
    // 2. CARICAMENTO SCATOLE (Logica esistente corretta per salvare oggetti completi)
    const ddtSelect = document.getElementById("ddtSelect");
    if (ddtSelect) {
        ddtSelect.addEventListener("change", function () {
            const idDdt = this.value;
            const container = document.getElementById("scatoleContainer");
            if (!idDdt) return;

            fetch(`/pallet/api/scatole/pallettizzazione?idDdt=${idDdt}`)
                .then(res => res.json())
                .then(data => {
                    container.innerHTML = '';
                    scatoleSelezionate = []; 
                    aggiornaContatore();
                    data.forEach(s => {
                        const col = document.createElement("div");
                        col.className = "col";
                        col.innerHTML = `
                            <div class="card h-100 scatola-card" id="card-${s.idScatola}" 
                                 onclick="toggleScatola(${s.idScatola}, '${s.codiceScatola}', ${s.numeroMazzette})">
                                <div class="card-body">
                                    <h5 class="card-title text-primary mb-1">${s.codiceScatola}</h5>
                                    <p class="card-text mb-0 small"><strong>Mazzette:</strong> ${s.numeroMazzette}</p>
                                </div>
                            </div>`;
                        container.appendChild(col);
                    });
                });
        });
    }

    // 3. BOTTONE SALVA -> APRE MODALE
    document.getElementById("btnSalvaPallet")?.addEventListener("click", preparaModale);
    
    // 4. INVIO FINALE FORM
    document.getElementById("btnConfermaFinale")?.addEventListener("click", () => {
        document.getElementById('formPallet').submit();
    });
});

function toggleScatola(id, codice, mazzette) {
    const card = document.getElementById(`card-${id}`);
    const index = scatoleSelezionate.findIndex(s => s.id === id);

    if (index > -1) {
        scatoleSelezionate.splice(index, 1);
        card.classList.remove("selected-card");
    } else {
        scatoleSelezionate.push({id, codice, mazzette});
        card.classList.add("selected-card");
    }
    
    document.getElementById("idsHidden").value = scatoleSelezionate.map(s => s.id).join(",");
    aggiornaContatore();
}

function aggiornaContatore() {
    const info = document.getElementById("countInfo");
    if (info) info.innerText = scatoleSelezionate.length + " scatole selezionate";
}

function preparaModale() {
    if (scatoleSelezionate.length === 0) {
        alert("Seleziona almeno una scatola!");
        return;
    }
    
    // Popola i dati nella modale
    document.getElementById("resumoDdt").innerText = document.getElementById("ddtSelect").options[document.getElementById("ddtSelect").selectedIndex].text;
    document.getElementById("resumoScatole").innerText = scatoleSelezionate.length;
    
    const lista = document.getElementById("listaScatoleConferma");
    lista.innerHTML = scatoleSelezionate.map(s => 
        `<li class="list-group-item d-flex justify-content-between"><span>${s.codice}</span><span>${s.mazzette} mazz.</span></li>`
    ).join('');

    modalBootstrap.show();
}