package com.delfia.springboot.web.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.delfia.springboot.web.model.User;
import com.delfia.springboot.web.service.UserDetailsServiceImpl;
import com.delfia.springboot.web.service.UserRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsServiceImpl userDetailsService;

	@Autowired
	private UserRepository repository;

//	@Autowired
//	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
//		List<User> users = repository.findAll();
//		for (User user : users) {
//			if (user.getUsername().equals("Delfia_11") && user.getPassword().equals("test123")) {
//				auth.inMemoryAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance()).withUser("Delfia_11")
//						.password("test123").roles("USER", "ADMIN");
//			} else {
//				auth.inMemoryAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance())
//						.withUser(user.getUsername()).password(user.getPassword()).roles("USER");
//			}
//		}
//
//	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/login", "/h2-console/**").permitAll().antMatchers("/", "/*todo*/**")
				.permitAll().and().formLogin().loginPage("/login").permitAll().and().logout().permitAll();

//		http.authorizeRequests().antMatchers("/login", "/register", "/h2-console/**").permitAll()
//				.antMatchers("/", "/*todo*/**").permitAll().and().formLogin().loginPage("/login").permitAll().and()
//				.formLogin().loginPage("/register").and().logout().permitAll();
//
		http.csrf().disable();
		http.headers().frameOptions().disable();
	}

	@Bean
	public AuthenticationManager customAuthenticationManager() throws Exception {
		return authenticationManager();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
	}
}
