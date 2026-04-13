package com.example.esempioFiven.security;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.example.esempioFiven.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

	private static final Logger log = LoggerFactory.getLogger(CustomAuthenticationFailureHandler.class);
    
	
    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
    	String username = request.getParameter("username");
        userService.loginFailed(username);

        log.warn("Login failed for user {}", username);

        // salva l'errore come Flash Attribute temporaneo
        request.getSession().setAttribute("loginError", "Credenziali non valide o utente disabilitato");

        response.sendRedirect("/login?error=true");
    }
}
