package com.delfia.springboot.web.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.delfia.springboot.web.model.Todo;

public interface TodoRepository extends JpaRepository<Todo, Integer> {

	public List<Todo> findByUsername(String username);
	
	public List<Todo> findByUsernameAndIsDone(String username, boolean isDone);
}
