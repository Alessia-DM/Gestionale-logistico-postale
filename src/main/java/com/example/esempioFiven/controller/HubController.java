  package com.example.esempioFiven.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.esempioFiven.model.User;
import com.example.esempioFiven.mybatis.mapper.UserMapper;
import com.example.esempioFiven.service.ClientiService;
import com.example.esempioFiven.service.MacroserviziService;
import com.example.esempioFiven.service.UserService;

@Controller
public class HubController {
	

	private final ClientiService clientiService;
	private final UserService userService;	
	private final UserMapper userMapper;
	private final MacroserviziService macroserviziService;
	
	public HubController(UserMapper userMapper, ClientiService clientiService, UserService userService, MacroserviziService macroserviziService) {
		this.userMapper=userMapper;
		this.clientiService=clientiService;
		this.userService=userService;
		this.macroserviziService=macroserviziService;
	}
	
	@GetMapping("/clienti")
	public String listaClienti(Model model, Authentication auth) {
		//Prendo l'username
		String username=auth.getName();
		
		//Recupero l'user associato a quell'username nel DB
		User user=userMapper.getByUsername(username);
		
		//SERVE SEMPRE se voglio passare nome e cognome nella navbar
		model.addAttribute("descrizioneUtente", user.getDescrizione());
		
		model.addAttribute("clienti", clientiService.getAllClienti());
		
		return "clienti";		
	}
	

	@GetMapping("/operatori")
	public String listaOperatori(Model model, Authentication auth) {
		//Prendo l'username
		String username=auth.getName();
		
		//Recupero l'user associato a quell'username nel DB
		User user=userMapper.getByUsername(username);
		
		//SERVE SEMPRE se voglio passare nome e cognome nella navbar
		model.addAttribute("descrizioneUtente", user.getDescrizione());
		
		model.addAttribute("utenti", userService.getAllOperatori());
		
		return "operatori";		
	}
	
	@GetMapping("/macroservizi")
	public String listaMacroservizi(Model model, Authentication auth) {
		
		//Codice necessario solo per visualizzare il nome e cognome sulla navbar 
		String username = auth.getName();
		User user=userMapper.getByUsername(username);
		model.addAttribute("descrizioneUtente", user.getDescrizione());
		
		//Per la stampa dei macroservizi con i servizi associati
		model.addAttribute("macroservizi", macroserviziService.findAllWithServizi());
			
		
		return "macroservizi";
	}
}
