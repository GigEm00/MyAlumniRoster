package com.webapp.myalumniroster.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.webapp.myalumniroster.model.Customers;

@Controller
@SessionAttributes("loggedInUser")
public class AppController {
	 
	private static final Logger logger=LoggerFactory.getLogger("AppController.class");
	  
	@GetMapping("hellow")
	@ResponseBody
	String hellow() {		
	return "Hellow from controller";		
	}
	
	@GetMapping("about")
	String about(Model model) {
	 model.addAttribute("success", "This is about us");
	return "about";
		
	}
	
	@GetMapping(value={"/","index"})	
	String index(Model model) {
	model.addAttribute("_home", "active");	
	return "index";		
	}
	
	@GetMapping("contact")
	String contact(Model model) {
	 model.addAttribute("msg", "Contact Us");
	 model.addAttribute("_contact", "active");
	 return "contact";		
	}
	
	@PostMapping("name")
	String namepost(@RequestParam String lname, @RequestParam String fname, 
			Model model) {
		model.addAttribute("msg", "Contact Us");
	    model.addAttribute("success", lname+" "+fname);
	 return "index";		
	}
	
	@GetMapping("name")
	String name(@RequestParam String lname, @RequestParam String fname, 
			Model model) {
		model.addAttribute("msg", "Contact Us");
	    model.addAttribute("success", lname+" "+fname);
	 return "index";		
	}
	
	@ModelAttribute("customer")
	Customers intModel() {
	return new Customers();		
	}
	
}
