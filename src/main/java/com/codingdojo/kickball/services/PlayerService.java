package com.codingdojo.kickball.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.kickball.models.Player;
import com.codingdojo.kickball.repositories.PlayerRepository;

@Service
public class PlayerService {
	@Autowired
	PlayerRepository playerRepository;

	public PlayerService(PlayerRepository playerRepository) {
		this.playerRepository = playerRepository;
	}

	public List<Player> allPlayers() {
		return playerRepository.findAll();
	}

	public Player createPlayer(Player p) {
		return playerRepository.save(p);
	}

	public Player findPlayer(Long id) {
		Optional<Player> optionalPlayer = playerRepository.findById(id);
		if (optionalPlayer.isPresent()) {
			return optionalPlayer.get();
		} else {
			return null;
		}
	}

	public void deleteById(Long id) {
		playerRepository.deleteById(id);
	}

	public void deleteByTeamId(Long id) {
		playerRepository.deleteByTeamId(id);
	}
}
