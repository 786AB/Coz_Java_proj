package com.crts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.crts.service.UserService;

@RestController
@RequestMapping("/")
public class HomeController {

	@Autowired
	private UserService userService;

	@GetMapping("/index")
	public String welcome() {
		return "index";
	}

	@GetMapping("/login")
	public ResponseEntity<String> checklogin(@RequestParam("username") String username) {
		boolean getuser = this.userService.getuser(username);
		if (getuser == true) {
			return new ResponseEntity<String>("home", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("", HttpStatus.NOT_FOUND);
		}
	}

}
