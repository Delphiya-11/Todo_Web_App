package com.delfia.springboot.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.delfia.springboot.web.model.User;
import com.delfia.springboot.web.service.UserRepository;

@Controller
@SessionAttributes("username")
public class WelcomeController {
	
	@Autowired
	private UserRepository repository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showWelcomePage(ModelMap model) {
		User user = repository.findByUsername(getLoggedInUserName());
		model.put("username", user.getUsername());
		model.put("firstname", user.getFirstname());
		model.put("lastname", user.getLastname());
		return "welcome";
	}

	private String getLoggedInUserName() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails)
			return ((UserDetails) principal).getUsername();
		return principal.toString();
	}

}
