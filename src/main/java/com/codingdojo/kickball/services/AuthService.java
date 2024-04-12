package com.codingdojo.kickball.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.kickball.models.User;
import com.codingdojo.kickball.repositories.AuthRepository;

@Service
public class AuthService {
	
	@Autowired
	AuthRepository repo;
	public User get(Long id) {
		return repo.findById(id).orElse(null);
	}
	
	public User getEmail(String email) {
		return repo.findByEmail(email);
	}
	
	public User create(User user) {
		return repo.save(user);
	}
}
 