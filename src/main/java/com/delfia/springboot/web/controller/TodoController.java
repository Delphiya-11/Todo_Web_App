package com.delfia.springboot.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.delfia.springboot.web.model.Todo;
import com.delfia.springboot.web.service.TodoRepository;

@Controller
@SessionAttributes("username")
public class TodoController {

//	@Autowired
//	private TodoService service;

	@Autowired
	private TodoRepository repository;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	private String getLoggedInUserName(ModelMap model) {
		return (String) model.get("username");
	}

	@RequestMapping(value = "/list-todos", method = RequestMethod.GET)
	public String showTodos(ModelMap model) {
		String name = getLoggedInUserName(model);
		if (name.equals(null))
			return "error";
		model.put("todos", repository.findByUsername(name));
//		model.addAttribute("todos", service.retrieveTodos(name));
		return "list-todos";
	}

	@RequestMapping(value = "/add-todo", method = RequestMethod.GET)
	public String showAddTodoPage(ModelMap model) {
		if (getLoggedInUserName(model).equals(null))
			return "error";
		model.addAttribute("todo", new Todo(0, getLoggedInUserName(model), "", new Date(), false));
		return "todo";
	}

	@RequestMapping(value = "/add-todo", method = RequestMethod.POST)
	public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
		if (result.hasErrors()) {
			return "todo";
		} else if (getLoggedInUserName(model).equals(null)) {
			return "error";
		}
		todo.setUsername(getLoggedInUserName(model));
		repository.save(todo);
//		service.addTodo(getLoggedInUserName(model),todo.getDesc(),new Date(),false);
		return "redirect:/list-todos";
	}

	@RequestMapping(value = "/delete-todo", method = RequestMethod.GET)
	public String deleteTodo(ModelMap model, @RequestParam int id) {
//		if(id==1)
//			throw new RuntimeException("DummyException");
		if (getLoggedInUserName(model).equals(null))
			return "error";
		repository.deleteById(id);
//		service.deleteTodo(id);
		model.clear();
		return "redirect:/list-todos";
	}

	@RequestMapping(value = "/update-todo", method = RequestMethod.GET)
	public String showUpdateTodoPage(ModelMap model, @RequestParam int id) {
		if (getLoggedInUserName(model).equals(null))
			return "error";
		Todo todo = repository.findById(id).get();
		model.put("todo", todo);
//		model.addAttribute("todo", service.retrieveTodo(id));
		return "todo";
	}

	@RequestMapping(value = "/update-todo", method = RequestMethod.POST)
	public String updateTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
		if (result.hasErrors()) {
			return "todo";
		} else if (getLoggedInUserName(model).equals(null)) {
			return "error";
		}
		todo.setUsername(getLoggedInUserName(model));
		repository.save(todo);
//		service.update(todo);
		return "redirect:/list-todos";
	}

	@RequestMapping(value = "/left-todos", method = RequestMethod.GET)
	public String showLeftTodosPage(ModelMap model) {
		String name = getLoggedInUserName(model);
		if (name.equals(null))
			return "error";
		model.put("todos", repository.findByUsernameAndIsDone(name, false));
//		model.addAttribute("todos", service.retrieveTodos(name));
		return "left-todos";
	}

	@RequestMapping(value = "/done-todos", method = RequestMethod.GET)
	public String showDoneTodosPage(ModelMap model) {
		String name = getLoggedInUserName(model);
		if (name.equals(null))
			return "error";
		model.put("todos", repository.findByUsernameAndIsDone(name, true));
//		model.addAttribute("todos", service.retrieveTodos(name));
		return "done-todos";
	}

	@RequestMapping(value = "/todo-done", method = RequestMethod.GET)
	public String doneTodo(ModelMap model, @RequestParam int id) throws Exception {
		if (getLoggedInUserName(model).equals(null))
			return "error";
		Date date = new Date();
		Todo todo = repository.findById(id).get();
		todo.setUsername(getLoggedInUserName(model));
		todo.setDone(true);
		todo.setTargetDate(date);
		repository.save(todo);
		model.put("todo", todo);
//		model.addAttribute("todo", service.retrieveTodo(id));
		return "redirect:/left-todos";
	}

}
