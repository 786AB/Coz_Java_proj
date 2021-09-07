package com.crts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crts.service.UserService;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private UserService userService;

	@RequestMapping("/index")
	public String welcome() {
		return "Login";
	}

	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@GetMapping("/loginProcess")
	public String checklogin(@RequestParam("username") String username, @RequestParam("password") String password) {
		boolean getuser = this.userService.getuser(username, password);
		if (getuser == true) {

			return "redirect:/home";
		} else {
			System.out.println("fail");
			return "redirect:/index";
		}
	}

}