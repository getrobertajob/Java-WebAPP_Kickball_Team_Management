package com.codingdojo.kickball.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.kickball.models.Player;

@Repository
public interface PlayerRepository extends CrudRepository<Player, Long> {
    // this method retrieves all travel records from the database
    List<Player> findAll();

	void deleteByTeamId(Long id);
}
