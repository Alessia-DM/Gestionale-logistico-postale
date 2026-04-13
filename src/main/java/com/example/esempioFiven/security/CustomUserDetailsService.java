package com.example.esempioFiven.security;


import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.esempioFiven.model.User;
import com.example.esempioFiven.service.UserService;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserService userService;

    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userService.getUserByUsername(username);

        if (!Boolean.TRUE.equals(user.getEnabled())) {
            throw new DisabledException("Utente non abilitato all'accesso.");
        }

        return new CustomUserDetails(user);
    }

}
