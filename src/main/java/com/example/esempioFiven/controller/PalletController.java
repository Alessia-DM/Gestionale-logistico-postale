package com.example.esempioFiven.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.esempioFiven.model.Pallet;
import com.example.esempioFiven.model.Scatola;
import com.example.esempioFiven.model.User;
import com.example.esempioFiven.mybatis.mapper.DdtMapper;
import com.example.esempioFiven.mybatis.mapper.PalletMapper;
import com.example.esempioFiven.mybatis.mapper.ScatoleMapper;
import com.example.esempioFiven.mybatis.mapper.UserMapper;
import com.example.esempioFiven.service.PalletService;

@Controller
@RequestMapping("/pallet")
public class PalletController {
	
	private final UserMapper userMapper;
	private final PalletService palletService;
	private final PalletMapper palletMapper;
	private final DdtMapper ddtMapper;
	private final ScatoleMapper scatoleMapper;
	
	
	public PalletController(UserMapper userMapper, PalletService palletService,
			PalletMapper palletMapper, DdtMapper ddtMapper, ScatoleMapper scatoleMapper) {
		this.userMapper=userMapper;
		this.palletService=palletService;
		this.palletMapper=palletMapper;
		this.ddtMapper=ddtMapper;
		this.scatoleMapper=scatoleMapper;
	}
	
	@GetMapping("")
	public String stampaPallet(@RequestParam(name="page", defaultValue="0") int page, Model model, Authentication auth) {
		//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		model.addAttribute("descrizioneUtente", user.getDescrizione());
				
		//Necessario per l'impaginazione
		int pageSize=10; //ovvero il numero di elementi che voglio in ogni pagina
		int totaleElementi = palletMapper.countPallet();
		int totalePagine = palletService.getTotPage(pageSize);
				
		
		model.addAttribute("mostraInserimento", false);
		model.addAttribute("pagAtt",page);
		model.addAttribute("listaPallet", palletService.getPalletPage(page, pageSize));
		model.addAttribute("totalePallet", totaleElementi);
		model.addAttribute("totalePagine", totalePagine);
		model.addAttribute("nuovoPallet", new Pallet());
		
		// AGGIUNGI QUESTE RIGHE per evitare l'errore 500
	    if (!model.containsAttribute("idPalletDaStampare")) {
	        model.addAttribute("idPalletDaStampare", null);
	    }
	    if (!model.containsAttribute("messaggioSuccesso")) {
	        model.addAttribute("messaggioSuccesso", null);
	    }
	    if (!model.containsAttribute("messaggioErrore")) {
	        model.addAttribute("messaggioErrore", null);
	    }
				
		return "pallet";
				
	}
	
	//Per permettere l'accesso solo agli admin
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/inserimento")
	public String mostraFormPallet(@RequestParam(name="page", defaultValue="0") int page, Model model, Authentication auth) {
		
		//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		model.addAttribute("descrizioneUtente", user.getDescrizione());
		
		model.addAttribute("listaDdt", ddtMapper.findAllIdDdt());
		model.addAttribute("nuovoPallet", new Pallet());
		model.addAttribute("mostraInserimento", true);

		return "pallet";
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@PostMapping("/salva")
	public String salvaPallet(@ModelAttribute Pallet nuovoPallet, @RequestParam("idScatoleSelezionate") List<Integer> idScatole,
								Authentication auth, RedirectAttributes ra) {
		
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		
		nuovoPallet.setIdOperatoreFK(user.getIdOperatore());
		
		Integer idPallet=palletService.creaPalletConScatole(nuovoPallet, idScatole);
		
		// Passiamo l'ID alla pagina per il popup di stampa
	    ra.addFlashAttribute("idPalletDaStampare", idPallet);
	    return "redirect:/pallet";
	}
	
	
	@GetMapping("/stampa/{id}")
	public String generaEtichetta(@PathVariable Integer id, Model model) {
		
		model.addAttribute("pallet", palletService.getPalletById(id));
	    model.addAttribute("scatole", scatoleMapper.findScatoleByPallet(id));
	    
	    return "etichetta"; 
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/api/scatole/pallettizzazione")
	@org.springframework.web.bind.annotation.ResponseBody
	public List<Scatola> getScatolePerDdt(@RequestParam Integer idDdt) {
	    return scatoleMapper.findDisponibiliPerDdt(idDdt);
	}

	
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/elimina/{id}")
	public String elimina(@PathVariable Integer id, RedirectAttributes ra) {
	    try {
	        palletService.eliminaPalletESvincolaScatole(id);
	        ra.addFlashAttribute("messaggioSuccesso", "Pallet eliminato. Le scatole sono di nuovo disponibili per l'inserimento.");
	    } catch (Exception e) {
	        ra.addFlashAttribute("messaggioErrore", "Impossibile eliminare il pallet: " + e.getMessage());
	    }
	    return "redirect:/pallet";
	}
	
	
}
