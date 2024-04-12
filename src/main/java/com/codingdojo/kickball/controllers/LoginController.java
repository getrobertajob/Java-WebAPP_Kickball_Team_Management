package com.codingdojo.kickball.controllers;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.kickball.models.LoginUser;
import com.codingdojo.kickball.models.User;
import com.codingdojo.kickball.services.AuthService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginController {

	@Autowired
	private AuthService auth;

	@Autowired
	private HttpSession session;

	@GetMapping("/")
	public String index(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("loginUser", new LoginUser());
		return "index.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {

		User possibleUser = auth.getEmail(user.getEmail());

		if (possibleUser != null) {
			result.rejectValue("email", "unique", "Email already exists in the database. Please try another email.");
		}

		if (!user.getPassword().equals(user.getConfirmPassword())) {
			result.rejectValue("password", "matches", "Both Passwords must match");
		}

		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "index.jsp";
		}
		String hashedPw = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashedPw);
		Long userId = auth.create(user).getId();

		session.setAttribute("loggedInUserId", userId);
		return "redirect:/home";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model) {

		User potentialUser = auth.getEmail(loginUser.getEmail());

		if (potentialUser == null) {
			result.rejectValue("email", "invalid user", "Invalid login");
		} else {

			if (!BCrypt.checkpw(loginUser.getPassword(), potentialUser.getPassword())) {
				result.rejectValue("email", "invalid user", "Invalid login");
			}

		}

		if (result.hasErrors()) {
			model.addAttribute("user", new User());
			return "index.jsp";
		}

		session.setAttribute("loggedInUserId", potentialUser.getId());
		return "redirect:/home";
	}

	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
}
