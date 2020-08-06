package com.delfia.springboot.web.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.delfia.springboot.web.model.User;
import com.delfia.springboot.web.service.UserRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	UserRepository repository;

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		List<User> users = repository.findAll();
		for (User user : users) {
			if (user.getUsername().equals("Delfia") && user.getPassword().equals("test123")) {
				auth.inMemoryAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance()).withUser("Delfia")
						.password("test123").roles("USER", "ADMIN");
			} else {
				auth.inMemoryAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance())
						.withUser(user.getUsername()).password(user.getPassword()).roles("USER");
			}
		}

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/login", "/h2-console/**").permitAll().antMatchers("/", "/*todo*/**")
				.access("hasRole('USER')").and().formLogin().loginPage("/login").permitAll().and().logout().permitAll();

		http.csrf().disable();
		http.headers().frameOptions().disable();
	}
}
