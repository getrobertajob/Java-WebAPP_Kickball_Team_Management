package com.codingdojo.kickball.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.kickball.models.Team;

@Repository
public interface TeamRepository extends CrudRepository<Team, Long> {
    // this method retrieves all travel records from the database
    List<Team> findAll();
    // this method counts how many names contain a certain string
//    Long countByNameContaining(String search);
//    // this method deletes a travel record that starts with a specific name
//    Long deleteByNameStartingWith(String search);
}
