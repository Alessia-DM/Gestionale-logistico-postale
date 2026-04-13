package com.example.esempioFiven.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login(HttpServletRequest request, Model model, @RequestParam(required = false) String logout) {
        
    	if (logout != null) {
            model.addAttribute("logoutMessage", "Hai effettuato il logout con successo.");
        }    	
    	
    	// legge l'errore dalla sessione e lo rimuove subito
        Object loginError = request.getSession().getAttribute("loginError");
        if (loginError != null) {
            model.addAttribute("loginError", loginError);
            request.getSession().removeAttribute("loginError"); // rimuove dopo averlo letto
        }
        return "login";
    }
}
