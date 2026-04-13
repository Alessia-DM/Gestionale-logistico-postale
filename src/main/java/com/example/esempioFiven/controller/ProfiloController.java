package com.example.esempioFiven.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.esempioFiven.dto.ProfiloUserDTO;
import com.example.esempioFiven.dto.ProfiloUserModificaDTO;
import com.example.esempioFiven.mapper.ProfiloUserMapper;
import com.example.esempioFiven.model.User;
import com.example.esempioFiven.mybatis.mapper.UserMapper;

@Controller
public class ProfiloController {
	
	private final UserMapper userMapper;
	
	public ProfiloController(UserMapper userMapper) {
		this.userMapper=userMapper;
	}
	
	
	//Visualizzazione della scheda utente (read-only)
	@GetMapping("/profilo")
	public String profilo(Model model, Authentication authentication,
			@RequestHeader(value = "referer", required = false) String referer) {
		
		//Prendo l'username
		String username=authentication.getName();
		
		//Recupero l'user associato a quell'username nel DB
		User user=userMapper.getByUsername(username);
		
		//Converto l'user in DTO (per poter prendere solo alcuni dati)
		ProfiloUserDTO profiloDTO=ProfiloUserMapper.toDTO(user);
		
		//Passo il DTO al model che verrà sgtampato nell'html
		model.addAttribute("utente",profiloDTO);
		
		
		//SERVE SEMPRE se voglio passare nome e cognome nella navbar
		model.addAttribute("descrizioneUtente", user.getDescrizione());
		
		// Per il tasto indietro
	    String backUrl = "/"; // homepage impostata di default
	    // Se il referer esiste e non punta a se stesso (o alla pagina di edit)
	    if (referer != null && !referer.contains("/profilo")) {
	        backUrl = referer;
	    }
	    
	    model.addAttribute("backUrl", backUrl);
		
		return "profilo";		
	}
	
	//Visualizzazione del form per la modifica 
	@GetMapping("/profilo/edit")
    public String editProfile(Model model, Authentication authentication) {
        String username = authentication.getName();
        User user = userMapper.getByUsername(username);
        ProfiloUserModificaDTO editDTO = ProfiloUserMapper.toEditDTO(user);
        model.addAttribute("utente", editDTO);
        model.addAttribute("descrizioneUtente", user.getDescrizione());
        return "modificaProfilo";
    }
	
	// Salvataggio modifiche
    @PostMapping("/profilo/edit")
    public String saveProfile(ProfiloUserModificaDTO editDTO, Authentication authentication,RedirectAttributes redirectAttributes) {
        String username = authentication.getName();
        userMapper.updateProfilo(username,
                                 editDTO.getEmail(),
                                 editDTO.getTelFisso(),
                                 editDTO.getTelMobile());
        
        //Messaggio flash che durerà solo fino alla prossima richiesta
        redirectAttributes.addFlashAttribute("successMessage", "Profilo aggiornato correttamente!");
        
        return "redirect:/profilo";
    }

}
