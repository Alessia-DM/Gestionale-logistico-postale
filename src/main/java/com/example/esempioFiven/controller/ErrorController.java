package com.example.esempioFiven.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/403")
    public String accessDenied() {
        return "error/403"; // Cercherà il file src/main/resources/templates/error/403.html
    }
}
