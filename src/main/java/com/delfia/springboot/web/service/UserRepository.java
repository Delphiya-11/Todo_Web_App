package com.delfia.springboot.web.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.delfia.springboot.web.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByUsername(String username);
}
