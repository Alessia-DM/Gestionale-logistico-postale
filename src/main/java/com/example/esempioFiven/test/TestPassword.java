package com.example.esempioFiven.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class TestPassword {
    public static void main(String[] args) {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        String hashDb = "$2a$10$7t0mD8YQh5R0P6H3zWjGmOjPjNf2B0XlYQx1l5n1Lq0F6kHf2Z8vK";
        boolean match = encoder.matches("Ale17", hashDb);
        System.out.println("PASSWORD MATCH: " + match);
    }
}

