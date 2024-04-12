package com.codingdojo.kickball.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.kickball.models.User;

@Repository
public interface AuthRepository extends CrudRepository<User, Long> {
	
	public User findByEmail(String email);
}
