package com.example.esempioFiven.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.esempioFiven.dto.ScatolaFiltri;
import com.example.esempioFiven.model.DDT;
import com.example.esempioFiven.model.Scatola;
import com.example.esempioFiven.model.User;
import com.example.esempioFiven.mybatis.mapper.DdtMapper;
import com.example.esempioFiven.mybatis.mapper.ScatoleMapper;
import com.example.esempioFiven.mybatis.mapper.UserMapper;
import com.example.esempioFiven.service.ClientiService;
import com.example.esempioFiven.service.DdtService;
import com.example.esempioFiven.service.ScatoleService;

import jakarta.validation.Valid;


@Controller
public class SezioneScatoleController {

	private final UserMapper userMapper;
	private final ScatoleService scatoleService;
	private final ClientiService clientiService;
	private final ScatoleMapper scatoleMapper;
	private final DdtService ddtService;
	private final DdtMapper ddtMapper;
	
	public SezioneScatoleController (ScatoleService scatoleService, UserMapper userMapper, ClientiService clientiService, ScatoleMapper scatoleMapper, DdtService ddtService, DdtMapper ddtMapper) {
		this.scatoleService=scatoleService;
		this.userMapper=userMapper;
		this.clientiService=clientiService;
		this.scatoleMapper=scatoleMapper;
		this.ddtService=ddtService;
		this.ddtMapper=ddtMapper;
	}
	
	
	@GetMapping("/scatole")
	public String stampaScatole(ScatolaFiltri filtri, Model model, Authentication auth) {		
		
		//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		model.addAttribute("descrizioneUtente", user.getDescrizione());
		
		
		//Per il passaggio dell'operatore da stringa a int
	    if (filtri.getOperatore() != null && !filtri.getOperatore().isEmpty()) {
	        // Supponendo che userMapper abbia un metodo per cercare per descrizione
	        User opTrovato = userMapper.getByUsername(filtri.getOperatore());
	        if (opTrovato != null) {
	            filtri.setOperatore(opTrovato.getIdOperatore().toString());
	        }
	    }
		
		//Necessario per l'impaginazione
		int pageSize=5; //ovvero il numero di elementi che voglio in ogni pagina
		model.addAttribute("scatole", scatoleService.getScatolePaginate(filtri, pageSize));
		
		int totaleElementi = scatoleMapper.countScatole(
			    filtri.getStato(), filtri.getCleanKeyword(), 
			    filtri.getStartDate(), filtri.getEndDate(), filtri.getOperatore()
		);
		
        model.addAttribute("totalePagine", scatoleService.getTotalePagine(filtri, pageSize));
        model.addAttribute("scatoleLavorateMese", scatoleService.getProduttivitaMese(user.getDescrizione()));
        model.addAttribute("totaleScatole", totaleElementi);
        model.addAttribute("listaOperatori", scatoleService.getListaOperatori());
        model.addAttribute("listaStati",scatoleService.getListaStati());
		

        //per passare tutto l'oggetto filtro 
        model.addAttribute("f",filtri);
	    
		return "scatole";
	}
	
	@GetMapping("/inserimento")
	public String inserimentoScatola(Model model, Authentication auth) {
		
		//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		model.addAttribute("descrizioneUtente", user.getDescrizione());
		
		model.addAttribute("nuovaScatola", new Scatola());
		model.addAttribute("listaClienti", clientiService.getAllClienti());
		model.addAttribute("listaIdDDT", ddtService.getAllIdDDT());
		model.addAttribute("listaScatoleDisponibili", scatoleService.listaScatoleDisponibili());
		
		return "inserimento";
		
	}
	
	@PostMapping("/scatole/salva")
	public String salvaScatola(@Valid @ModelAttribute("nuovaScatola") Scatola scatola, 
			RedirectAttributes ra, Authentication auth, Model model, BindingResult br,
			@RequestParam(required=false) String nomePrivato,
			@RequestParam(required=false) String cognomePrivato,
			@RequestParam(required=false) String cfPrivato, 
			@RequestParam(required=false) String email
			) {
		//@ModelAttribute serve per creare un'istanza della classe Scatola, cercare i setter
		// corrispondenti e inserire i valori direttamente nel form dell'oggetto java
		
		String username=auth.getName();
		User user=userMapper.getByUsername(username);
		
		//Nel caso in cui ci siano errori di validazione (ad esempio campi vuoti)
		if(br.hasErrors()) {
			//Vengono ricaricati i dati necessari per popolare la pag di inserimento
			scatola.setIdOperatoreFK(user.getIdOperatore());
			model.addAttribute("descrizioneUtente", user.getDescrizione());
			model.addAttribute("listaClienti", clientiService.getAllClienti());
			model.addAttribute("listaDDT", ddtService.getAllIdDDT());
			model.addAttribute("listaScatoleDisponibili", scatoleService.listaScatoleDisponibili());
			
			//Non bisogna fare il redirect ma riprendere la pagina di inserimento
			// così che saranno visibili gli errori
			return "inserimento";			
		}
		
		//Nel caso in cui non ci siano errori arriverà qui
		try {
			if (scatoleMapper.existsByCodice(scatola.getCodiceScatola())) {
			    ra.addFlashAttribute("messaggioErrore", "Errore: il codice scatola inserito è già esistente.");
			    return "redirect:/inserimento";
			}
			
			DDT ddtSelezionato= ddtService.getById(scatola.getIdDdtFK());
			Integer spedizioneAssociata = null;
			
			if(ddtSelezionato != null) {
				spedizioneAssociata=ddtSelezionato.getIdSpedizioneFK();
				scatola.setIdSpedizioneFK(spedizioneAssociata);
			}
			scatola.setIdOperatoreFK(user.getIdOperatore());
			scatoleService.inserimentoNuovaScatola(scatola);
			scatoleService.decrementoInventario(scatola.getTipologia());
			
			if (scatola.getIdDdtFK() != null) {
	            ddtMapper.aggiornaConteggioColli(scatola.getIdDdtFK());
	        }
			
			if(scatola.getIdClienteFK() != null && scatola.getIdClienteFK()== 0) {
				if (email != null && email.trim().isEmpty()) {
				    email = null;
				}
				clientiService.salvaPrivato(nomePrivato, cognomePrivato, cfPrivato, email, scatola.getIdScatola(), spedizioneAssociata, scatola.getIdDdtFK());
			}
			ra.addFlashAttribute("messaggioSuccesso", "Scatola creata correttamente.");
		} catch (Exception e) {
			e.printStackTrace(); 
		    ra.addFlashAttribute("messaggioErrore", "Errore: " + e.getClass().getSimpleName() + " - " + e.getMessage());
		}
		
		return "redirect:/inserimento";
	}
	
	@GetMapping("/api/scatole/check-codeScat")
	@ResponseBody
	public boolean checkCodeScat(@RequestParam("codice") String codice) {
	    return scatoleService.esisteScatola(codice); 
	}
	
	
	@GetMapping("/reggiatura")
	public String mostraPagReggiatura(Model model, Authentication auth, @RequestParam(name = "page", defaultValue = "0") int page, @RequestParam(name = "keywordRegg", required = false) String keywordRegg) {
		
		//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		model.addAttribute("descrizioneUtente", user.getDescrizione());

		int pageSizeRegg=10;
		int offsetRegg = page*pageSizeRegg;
		
		model.addAttribute("listaScatoleDaReggiare", scatoleService.getScatoleDaReggiare(pageSizeRegg,offsetRegg,keywordRegg));
		int totaleScatoleReggiatura=scatoleMapper.countScatoleDaReggiare(keywordRegg);
		model.addAttribute("totalePagine", (int) Math.ceil((double) totaleScatoleReggiatura / pageSizeRegg));
	    model.addAttribute("currentPage", page);
	    model.addAttribute("keywordRegg", keywordRegg);
		
		return "reggiatura";
	}
	
}
