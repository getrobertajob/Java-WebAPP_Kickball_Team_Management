// imports package for controllers
package com.codingdojo.kickball.controllers;

//imports
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.kickball.models.Player;
import com.codingdojo.kickball.models.Team;
import com.codingdojo.kickball.models.User;
import com.codingdojo.kickball.services.TeamService;
import com.codingdojo.kickball.services.UserService;

import com.codingdojo.kickball.services.PlayerService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

//class to store the main controller
@Controller // regular controller version is used for URL routing so that it can render JSP
			// files as HTML pages
public class KickballController {
	@Autowired
	TeamService teamService;

	@Autowired
	UserService userService;

	@Autowired
	PlayerService playerService;

	// method used to define the Service classes"
	public KickballController(TeamService teamService, UserService userService, PlayerService playerService) {
		this.teamService = teamService;
		this.userService = userService;
		this.playerService = playerService;
	}

	@Autowired
	private HttpSession session;

	// method to render the dashboard/index page
	@GetMapping("/home")
	public String dashboard(RedirectAttributes redirect, Model model, @ModelAttribute("team") Team team,
			@ModelAttribute("user") User user) {
		if (session.getAttribute("loggedInUserId") == null) {
			redirect.addFlashAttribute("notLoggedIn", "You must be logged in to view that page");
			return "redirect:/";
		}
		User currUser = userService.findUser((Long) session.getAttribute("loggedInUserId"));
		String userName = currUser.getUserName();
		model.addAttribute("userName", userName);
		List<Team> teams = teamService.allTeams();
		List<User> users = userService.allUsers();
		model.addAttribute("teams", teams);
		model.addAttribute("user", users);
		return "dashboard.jsp";
	}

	// method to render the details about a single team
	@GetMapping("/teams/{id}")
	public String displayTeamTeam(@ModelAttribute("player") Player player, @ModelAttribute("user") User user,
			@PathVariable("id") Long id, RedirectAttributes redirect, Model team, Model model) {
		if (session.getAttribute("loggedInUserId") == null) {
			redirect.addFlashAttribute("notLoggedIn", "You must be logged in to view that page");
			return "redirect:/";
		}
		team.addAttribute("team", teamService.findTeam(id));
		User currUser = userService.findUser((Long) session.getAttribute("loggedInUserId"));
		model.addAttribute(currUser);
		return "displayTeam.jsp";
	}

	// method to add a single player to a single team
	@PostMapping("/teams/{id}/addPlayer")
	public String addPlayer(@ModelAttribute("player") Player player, @PathVariable("id") Long id,
			BindingResult result) {
		if (result.hasErrors()) {
			return "displayTeam.jsp";
		} else {
			Player newPlayer = new Player();
			newPlayer.setPlayerName(player.getPlayerName());
			newPlayer.setTeam(teamService.findTeam(id));
			playerService.createPlayer(newPlayer);
			return "redirect:/teams/{id}";
		}
	}

	// method to render the edit page for a single team
	@GetMapping("/teams/{id}/edit")
	public String editTeam(@PathVariable("id") Long id, RedirectAttributes redirect, @ModelAttribute("user") User user,
			@ModelAttribute("team") Team team, Model model) {
		model.addAttribute("team", teamService.findTeam(id));
		if (session.getAttribute("loggedInUserId") == null) {
			redirect.addFlashAttribute("notLoggedIn", "You must be logged in to view that page");
			return "redirect:/";
		}
		return "editTeamForm.jsp";
	}

	// method to edit a single team
	@PutMapping("/teams/{id}/edit")
	public String update(@Valid @ModelAttribute("team") Team team, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "editTeamForm.jsp";
		}
		teamService.updateTeam(team);
		return "redirect:/home";
	}

	// method to render a page to add a new team
	@GetMapping("/teams/new")
	public String createTeamForm(@ModelAttribute("team") Team team, @ModelAttribute("user") User user,
			RedirectAttributes redirect, Model model) {
		if (session.getAttribute("loggedInUserId") == null) {
			redirect.addFlashAttribute("notLoggedIn", "You must be logged in to view that page");
			return "redirect:/";
		}
		User currUser = userService.findUser((Long) session.getAttribute("loggedInUserId"));
		Long user_id = currUser.getId();
		model.addAttribute("user_id", user_id);

		return "newTeamForm.jsp";
	}

	// method to add a new team
	@PostMapping("/teams/new")
	public String createTeam(@Valid @ModelAttribute("team") Team team, BindingResult result) {
		if (result.hasErrors()) {
			return "newTeamForm.jsp";
		} else {
			teamService.createTeam(team);
			return "redirect:/home";
		}
	}

	// method to delete a single team and the players connected to it
	@RequestMapping("/teams/{id}/delete")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		playerService.deleteByTeamId(id);
		teamService.deleteById(id);
		return "redirect:/home";
	}
}