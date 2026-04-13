package com.example.esempioFiven.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.esempioFiven.model.User;

public class CustomUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;
    private final User user;

    public CustomUserDetails(User user) {
        this.user = user;
    }

    /** ===== DATI PERSONALIZZATI ===== **/
    public String getNomeCompleto() {
        return user.getDescrizione(); // puoi cambiare in nome + cognome se aggiungi i campi
    }

    /** ===== METODI SPRING SECURITY ===== **/
    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public boolean isEnabled() {
        return Boolean.TRUE.equals(user.getEnabled());
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // Supponiamo: profiloId 1 = ADMIN, profiloId 2 = OPERATORE
        String roleName;
        if (user.getProfiloId() != null && user.getProfiloId() == 1) {
            roleName = "ROLE_ADMIN";
        } else {
            roleName = "ROLE_OPERATORE";
        }
        
        return Collections.singletonList(new org.springframework.security.core.authority.SimpleGrantedAuthority(roleName));
    }
    
    @Override public boolean isAccountNonExpired() { return true; }
    @Override public boolean isAccountNonLocked() { return true; }
    @Override public boolean isCredentialsNonExpired() { return true; }

    /** GET USER OR OTHER INFO **/
    public User getUser() {
        return user;
    }
}
