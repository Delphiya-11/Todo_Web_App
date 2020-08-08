package com.delfia.springboot.web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.delfia.springboot.web.model.User;
import com.delfia.springboot.web.service.UserRepository;

@Controller
@SessionAttributes("username")
public class LoginController {

	@Autowired
	private UserRepository repository;

//	private String getLoggedInUserName(ModelMap model) {
//		return (String) model.get("username");
//	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginPage(ModelMap model) {
		model.addAttribute("user", new User()); 
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleLogin(ModelMap model, @Valid User user, BindingResult result) {
		if (result.hasErrors())
			return "login";
		else {
			if (validateUser(user.getUsername(), user.getPassword())) {
				model.put("username", user.getUsername());
				return "welcome";
			}
			else {
				model.put("errorMessage", "Invalid Credentials!!");
				return "login";
			}
		}
	}

	private boolean validateUser(String username, String password) {
		boolean flag = false;
		List<User> users = repository.findAll();
		for (User obj : users) {
			if (obj.getUsername().equals(username) && obj.getPassword().equals(password)) {
				flag = true;
				break;
			} else {
				flag = false;
				continue;
			}
		}
		return flag;
	}
}
