// imports package for controllers
package com.codingdojo.kickball.controllers;

// imports
import java.util.List;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.kickball.models.Team;
import com.codingdojo.kickball.services.TeamService;

// class to store the API
// API will be used to feed data to the DB without users input
@RestController // Rest version is used for API's since it works with json file format
public class KickballApi {
	private final TeamService teamService;

	// method used to define the teamService class which is contained in the file "TeamService.java"
	public KickballApi(TeamService teamService) {
		this.teamService = teamService;
	}
	
	// method used to create an instance of a list and populate it with all records
	// no input from user and no data sent to DB except select all query
	@RequestMapping("/api/teams")
	public List<Team> allTeams() {
		// sends the list object to the "allTeams" method in the teamService
		return teamService.allTeams();
	}

	// method used to create a new record
	// uses "@RequestParam" to get values from form
	// and POST to send data to DB
	@RequestMapping(value = "/api/teams", method = RequestMethod.POST)
	public Team createTeam(@RequestParam(value = "name") String name) {
		// creates a new instance of the "Team" class and specifies the names of the values by way of Params above
		Team team = new Team(name);
		// sends the new instance of the "team" instance to the create method in the teamService
		return teamService.createTeam(team);
	}

	// method used to update an existing record
	// uses "@RequestParam" to get values from form
	// and POST to send data to DB
	@RequestMapping(value = "/api/teams/update/{id}", method = RequestMethod.POST)
	public Team updateTeam(@PathVariable("id") Long id, 
						@RequestParam(value = "name") String newName) {
		// populates the current method with the data from DB by ID
		Team team = teamService.findTeam(id);
		// sets each value to data from form
		team.setTeamName(newName);
		team.setUpdatedAt();
		// sends the new version of the "team" instance to the update method in the teamService
		return teamService.updateTeam(team);
	}

	// method used to get data on single record by ID
	@RequestMapping("/api/teams/{id}")
	public Team show(@PathVariable("id") Long id) {
		// creates a new instance of the "Team" class and passes ID sent by URL
		Team team = teamService.findTeam(id);
		// sends the new instance of the "team" populated with the return from the DB
		return team;
	}

	// method used to delete single record from DB by by ID
	@RequestMapping("/api/teams/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		// calls the delete method in the teamService and passes the ID which is sent by URL
		// no need to create a new instance of the "Team" class since we don't need the data from it
		teamService.deleteById(id);
		// returns just text confirmation as it's only an API with no need for the data afterwards
		return "The Team has been deleted";
	}
}