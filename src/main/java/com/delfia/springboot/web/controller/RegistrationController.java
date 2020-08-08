package com.delfia.springboot.web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.delfia.springboot.web.model.User;
import com.delfia.springboot.web.service.UserRepository;

@Controller
public class RegistrationController {

	@Autowired
	private UserRepository repository;

//	private String getLoggedInUserName(ModelMap model) {
//		return (String) model.get("username");
//	}

//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//	public String showRegisterPage(ModelMap model) {
//		model.addAttribute("user", new User());
//		return "register";
//	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(ModelMap model, @Valid User user, BindingResult result) {
		if (result.hasErrors())
			return "redirect:/login?error";
		else {
			if (checkUsers(user)) {
				repository.save(user);
				return "redirect:/login?success";
			} else {
				return "redirect:/login?error";
			}
		}
	}

	private boolean checkUsers(User user) {
		boolean flag = false;
		List<User> users = repository.findAll();
		if (users.isEmpty()) {
			return true;
		} else {
			for (User obj : users) {
				if (user.getUsername().equals(obj.getUsername())) {
					flag = false;
					break;
				} else if (user.getPassword().equals(obj.getPassword())) {
					flag = false;
					break;
				} else {
					flag = true;
					continue;
				}
			}
			return flag;
		}
	}

}
