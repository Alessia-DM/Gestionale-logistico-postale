package com.example.esempioFiven.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class GeneraPassword {
    public static void main(String[] args) {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        String rawPassword = "Ser3";
        String encoded = encoder.encode(rawPassword);
        System.out.println(encoded);
    }
}

