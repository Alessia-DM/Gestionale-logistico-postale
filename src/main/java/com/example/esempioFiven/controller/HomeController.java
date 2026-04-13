package com.example.esempioFiven.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.esempioFiven.security.CustomUserDetails;

//import com.app.gestionaleFiven.service.PaginaServiziService;

@Controller
public class HomeController {

	
//	private final PaginaServiziService service;
//	
//	public AltriServiziWebController(PaginaServiziService service) {
//		this.service=service;
//	}
	
	@GetMapping({"/","/homepage"})
    public String homepage(Authentication authentication, Model model) {
		
		if (authentication == null || !authentication.isAuthenticated()) {
	        return "redirect:/login";
	    }
        model.addAttribute("pageTitle", "Homepage");
        //model.addAttribute("servizi", service.findAll());
        model.addAttribute("content", "homepage"); 
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        model.addAttribute("descrizioneUtente", userDetails.getUser().getDescrizione());
        
        return "homepage"; // Thymeleaf cerca resources/templates/homepage.html
	}
    
}
