package com.webapp.myalumniroster.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webapp.myalumniroster.dto.ApiDataDto;
import com.webapp.myalumniroster.model.Customers;
import com.webapp.myalumniroster.service.ApiDataRetrievalService;
import com.webapp.myalumniroster.service.CustomerService;
import com.webapp.myalumniroster.util.ServiceUtils;
import com.webapp.myalumniroster.util.States;
import com.webapp.myalumniroster.validation.DataValidation;

@Controller
@SessionAttributes("loggedInUser")
public class CustomersController {
	
	@Value("${msg.register}")
	private String msg;
	
	@Autowired
	private ServiceUtils serviceUtils;
		
	@Autowired
	private ApiDataRetrievalService apiDataRetrievalService;
	
	@Autowired
	private DataValidation dataValidator;	
		
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("login")
	String login(Model model) {
		model.addAttribute("_login", "active");
		model.addAttribute("customer", new Customers());
	return "login";
	}
	
	@PostMapping("login")
	String login(@ModelAttribute Customers customer, Model model, RedirectAttributes redirect) {
		
		try {
			Customers cust= customerService.findByEmail(customer.getEmail());
			if(cust !=null && cust.getPassword().equals(customer.getPassword())){
				model.addAttribute("success","Welcome "+ cust.getFname()+
					" Login Success");
				model.addAttribute("loggedInUser", cust);
				model.addAttribute("user", cust);
				serviceUtils.getFiles(model, cust.getId());
			}else {
			redirect.addFlashAttribute("error","Invalid Credentials");
			return "redirect:/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return "redirect:/profile";
	}
	
	@GetMapping("profile")
	String profle(@SessionAttribute("loggedInUser") Customers cust, Model model) {
		
		try {
			serviceUtils.getFiles(model, cust.getId());
			ApiDataDto players = apiDataRetrievalService.retrievePlayerData();
			Customers dbCust =customerService.findById(cust.getId()).get();
			model.addAttribute("user", dbCust);
			model.addAttribute("_profile", "active");
			model.addAttribute("players", apiDataRetrievalService.getUserPlayers(players, dbCust.getCollege()));
			model.addAttribute("colleges", apiDataRetrievalService.getColleges(players) );
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "profile";
	}
	
	@GetMapping("myprofile-{id}")
	String user(@PathVariable long id,Model model, @SessionAttribute("loggedInUser") Customers cust) {
		serviceUtils.getFiles(model, id);
		Customers dbCust =customerService.findById(cust.getId()).get();
		ApiDataDto players = apiDataRetrievalService.retrievePlayerData();
		model.addAttribute("user", dbCust);
		model.addAttribute("_profile", "active");
		model.addAttribute("players", apiDataRetrievalService.getUserPlayers(players, dbCust.getCollege()));
		model.addAttribute("colleges", apiDataRetrievalService.getColleges(players) );
		return "profile";
	}
	
	@GetMapping("logout")
	public String logout(Model model, WebRequest request, 
			SessionStatus status, RedirectAttributes redirect) {	
		status.setComplete();
		request.removeAttribute("loggedInUser", WebRequest.SCOPE_SESSION);
		redirect.addFlashAttribute("success", "You have been signed out");
		return "redirect:/login";
	}
	
	
	@GetMapping("register")
	String register(Model model) {
		model.addAttribute("customers", new Customers());
		model.addAttribute("_register", "active");
	return "registaration";
	}
	
	@PostMapping("register")
	String sign(@ModelAttribute Customers cust, BindingResult result,
			RedirectAttributes red, Model model) {
		
		try {
			dataValidator.validate(cust, result);
			if (result.hasErrors()) {
				model.addAttribute("error", "Required* fields");
		        return "registaration";
	        }
			if(customerService.findByEmail(cust.getEmail()) == null) {
			cust.setRole("USER");
			customerService.save(cust);
			serviceUtils.sendMail(cust.getEmail(), msg+" Thanks "+cust.getFname(), "Registration");
			
			red.addFlashAttribute("msg", "Registration Success");
			}else {
			red.addFlashAttribute("msg", "user Exists");	
			return "redirect:/register";
			}
		} catch (Exception e) {
			red.addFlashAttribute("msg", "Registration Fail");
			e.printStackTrace();
		}	
		
	return "redirect:/login";
	}
	
	@GetMapping("users")
	String customers(Model model) {
	  try {
		model.addAttribute("list", customerService.findAll());
		model.addAttribute("_users", "active");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return "customers";
	}
	
	@GetMapping("edituser")
	String edituser(@RequestParam long id, Model model) {
		model.addAttribute("customer", customerService.findById(id));
		model.addAttribute("msg", "Update User");
	return "edituser";		
	}
	
	@PostMapping("editUser")
	String editUser(@ModelAttribute Customers cust, Model model, RedirectAttributes red) {
		
		try {
			customerService.update(cust);
			serviceUtils.getFiles(model, cust.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/profile";
		
	}
	
	@GetMapping("deleteuser-{id}")
	String deleteuser(@PathVariable long id, RedirectAttributes redirect){
		
		try {
			customerService.delete(id);
			redirect.addFlashAttribute("msg", "User Deleted");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/users";
	}
	
	@PostMapping("editrole")
	String editrole(@RequestParam String role, @RequestParam long id,
					RedirectAttributes redirect) {	
	try {
		customerService.giveRole(id, role);	
		redirect.addFlashAttribute("success","Role has been set ");
	} catch (Exception e) {
		e.printStackTrace();
	}		
	return "redirect:/users";		
	}
	
	@PostMapping("search")
	String search(@RequestParam String name, Model model){
		List<Customers> cust= customerService.findByName(name);
		model.addAttribute("msg", cust.size()+" found ");
		model.addAttribute("list", cust);
		model.addAttribute("_users", "active");
	return "customers";		
	}
	
	@PostMapping("sendemail")
	String sendemail(@RequestParam String message,
						@RequestParam String email,
						@RequestParam String subject,
						@RequestParam String name,
						Model model ) {
		try {
			if(serviceUtils.sendMail(email, message+"From "+name, subject) == "E-Mail Sent Successfully!")
			model.addAttribute("msg", "Your message has been sent. Thank you!");
			else {
				model.addAttribute("error", "Error sending message!");
			}
			model.addAttribute("_contact", "active");	
		} catch (Exception e) {
			e.printStackTrace();
				
		}
		
		return "contact";
	} 
	
	@ModelAttribute("customer")
	Customers initModel() {
	return new Customers();		
	}
	
	//for populating states 
    @ModelAttribute("states")
    public List<States> populateStates(){
        return Arrays.asList(States.values());
    }
	
}
