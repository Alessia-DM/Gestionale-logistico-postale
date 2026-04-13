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

import com.example.esempioFiven.model.DDT;
import com.example.esempioFiven.model.User;
import com.example.esempioFiven.mybatis.mapper.DdtMapper;
import com.example.esempioFiven.mybatis.mapper.UserMapper;
import com.example.esempioFiven.service.ClientiService;
import com.example.esempioFiven.service.DdtService;
@Controller
public class DdtController {
	
	private final UserMapper userMapper;
	private final DdtService ddtService;
	private final DdtMapper ddtMapper;
	private final ClientiService clientiService;
	
	
	public DdtController(UserMapper userMapper, DdtService ddtService, DdtMapper ddtMapper, ClientiService clientiService) {
		this.userMapper=userMapper;
		this.ddtService=ddtService;
		this.ddtMapper=ddtMapper;
		this.clientiService=clientiService;
	}
	
	@GetMapping("/ddt")
	public String stampaDdt(@RequestParam( name="page", defaultValue="0") int page,Model model, Authentication auth) {
		
		//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		model.addAttribute("descrizioneUtente", user.getDescrizione());
		
		//Necessario per l'impaginazione
		int pageSize=10; //ovvero il numero di elementi che voglio in ogni pagina
		int totaleElementi = ddtMapper.countDdt();
		int totalePagine = ddtService.getTotPag(pageSize);
		
		
		model.addAttribute("mostraInserimento", false);
		model.addAttribute("pagAtt",page);
		model.addAttribute("listaDdt", ddtService.getDdtPag(page, pageSize));
		model.addAttribute("totaleDdt", totaleElementi);
		model.addAttribute("totalePagine", totalePagine);
		model.addAttribute("nuovoDdt", new DDT());
		
		return "ddt";
		
	}
	
	@GetMapping("/ddt/inserimento")
	public String mostraFormDdt(@RequestParam(name="page", defaultValue="0") int page, Model model, Authentication auth) {
		
		//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		model.addAttribute("descrizioneUtente", user.getDescrizione());

		
		model.addAttribute("nuovoDdt", new DDT());
		model.addAttribute("mostraInserimento", true);
		model.addAttribute("listaClienti", clientiService.getAllClienti());

		return "ddt";
		
	}
	
	@PostMapping("/ddt/salva")
	public String salvaDdt(@ModelAttribute("nuovoDdt") DDT ddt, 
			Authentication auth, Model model,
			BindingResult br, RedirectAttributes ra,
			@RequestParam(required=false) String nomePrivato,
			@RequestParam(required=false) String cognomePrivato,
			@RequestParam(required=false) String cfPrivato, 
			@RequestParam(required=false) String email) {
		
		//Nel caso in cui ci siano errori di validazione (ad esempio campi vuoti)
		if(br.hasErrors()) {
			//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
			String username = auth.getName();
			User user=userMapper.getByUsername(username);
			model.addAttribute("descrizioneUtente", user.getDescrizione());
			
			//Vengono ricaricati i dati necessari per popolare la pag di inserimento
			model.addAttribute("nuovoDdt", new DDT());
			model.addAttribute("mostraInserimento", true);
			model.addAttribute("listaClienti", clientiService.getAllClienti());
			
			//Non bisogna fare il redirect ma riprendere la pagina di inserimento
			// così che saranno visibili gli errori
			return "ddt";			
		}

		
		try {
			//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
			String username = auth.getName();
			User user=userMapper.getByUsername(username);
			model.addAttribute("descrizioneUtente", user.getDescrizione());
			
			if (ddtMapper.existsByCodeDdt(ddt.getCodiceDdt())) {
			    ra.addFlashAttribute("messaggioErrore", "Errore: il codice scatola inserito è già esistente.");
			    return "redirect:/ddt/inserimento";
			}
			
			ddt.setIdOperatoreFK(user.getIdOperatore());
			ddtMapper.insertDdt(ddt);
			
			if(ddt.getIdClienteFK() != null && ddt.getIdClienteFK()== 0) {
				if (email != null && email.trim().isEmpty()) {
				    email = null;
				}

				clientiService.salvaPrivato(nomePrivato, cognomePrivato, cfPrivato, email, null, null, ddt.getIdDdt());
			}
			
			ra.addFlashAttribute("messaggioSuccesso", "DDT registrato con successo!");
			return "redirect:/ddt/inserimento";
	    } catch (Exception e) {
	    	e.printStackTrace();
	        ra.addFlashAttribute("messaggioErrore", "Errore durante il salvataggio.");
	    }
		
		return "redirect:/ddt/inserimento";
	}
	
	@GetMapping("/api/ddt/check-codeDdt")
	@ResponseBody
	public boolean checkCodeDdt(@RequestParam("codice") String codice) {
	    return ddtMapper.existsByCodeDdt(codice);
	}
}
