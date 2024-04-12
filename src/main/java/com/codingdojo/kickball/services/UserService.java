package com.codingdojo.kickball.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.kickball.models.User;
import com.codingdojo.kickball.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public List<User> allUsers() {
		return userRepository.findAll();
	}

	public User createUser(User p) {
		return userRepository.save(p);
	}

	public User findUser(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}
	}

	public User updateUser(User p) {
		return userRepository.save(p);
	}

	public void deleteById(Long id) {
		userRepository.deleteById(id);
	}

	public Long getUserCount() {
		return userRepository.count();
	}
}
