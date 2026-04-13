package com.example.esempioFiven.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity // Abilita l'uso di @PreAuthorize nei Controller
public class SecurityConfig {
	
	@Autowired
    private CustomAuthenticationFailureHandler customFailureHandler;

    @Autowired
    private CustomAuthenticationSuccessHandler customSuccessHandler;
    
    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
        	.userDetailsService(customUserDetailsService)
            .authorizeHttpRequests(auth -> auth
            	.requestMatchers(
            			"/login", 
            			"/css/**", 
            			"/img/**", 
            			"/js/**", 
            			"/webjars/**", 
            			"/errors.css")
            	.permitAll()
            	// Pagine a cui può accedere solo chi ha il ruolo di admin
                .requestMatchers("/inserimento/**",
                				"/scatole/salva",
                				"/pallet/inserimento",
                				"/pallet/salva",
                				"/ddt/inserimento",
                				"/ddt/salva",
                				"/api/ddt/check-codeDdt",
                				"/api/scatole/check-codeScat",
                				"/api/scatole/pallettizzazione").hasRole("ADMIN")
                // Tutto il resto richiede solo il login 
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/", true)
                .failureHandler(customFailureHandler)
                .successHandler(customSuccessHandler)
                .permitAll()
            )
            .logout(logout -> logout
            	.logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll()
            )
            // CSRF: Fondamentale per evitare il 403 sui form POST
            .csrf(csrf -> csrf
                .ignoringRequestMatchers("/logout", "/api/**") 
            )
            .exceptionHandling(exception -> exception
            	    .accessDeniedPage("/403") 
            )
            .rememberMe(remember -> remember
                .key("chiaveSegretaFiven")
                .tokenValiditySeconds(10800)
                .userDetailsService(customUserDetailsService)

            );

        return http.build();
    } 
}
