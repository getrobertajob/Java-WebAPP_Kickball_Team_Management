package com.codingdojo.kickball.services;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;

import com.codingdojo.kickball.models.Team;
import com.codingdojo.kickball.repositories.TeamRepository;

@Service
public class TeamService {
	private final TeamRepository teamRepository;

	public TeamService(TeamRepository teamRepository) {
		this.teamRepository = teamRepository;
	}

	public List<Team> allTeams() {
		return teamRepository.findAll();
	}

	public Team createTeam(Team t) {
		return teamRepository.save(t);
	}

	public Team findTeam(Long id) {
		Optional<Team> optionalTeam = teamRepository.findById(id);
		if (optionalTeam.isPresent()) {
			return optionalTeam.get();
		} else {
			return null;
		}
	}

	public Team updateTeam(Team t) {
		return teamRepository.save(t);
	}

	public void deleteById(Long id) {
		teamRepository.deleteById(id);
	}
}
