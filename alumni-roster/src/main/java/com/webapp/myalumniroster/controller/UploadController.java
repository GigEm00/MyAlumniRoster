package com.webapp.myalumniroster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webapp.myalumniroster.model.Customers;
import com.webapp.myalumniroster.repository.CustomerRepository;
import com.webapp.myalumniroster.util.ServiceUtils;


@Controller
@SessionAttributes("loggedInUser")
public class UploadController {

	@Autowired
	ServiceUtils serviceUtils;
	
	@Autowired
	private CustomerRepository customerRepository;

	@PostMapping("uploadMultipleFiles")
    public String uploadMultipleFiles(RedirectAttributes red, @RequestParam long id,@RequestParam("uploadingFiles") MultipartFile[] files){
  	    try {
		
		  if(serviceUtils.multiplesave(files, id)=="Success") {
		  red.addFlashAttribute("msg", files.length+ " Files uploaded<br>"); }
		  else {
			  //red.addFlashAttribute("msg", " Please select files<br>"); 
		 }	
		  	
    	} catch (Exception e) {
    		red.addFlashAttribute("error",  " unexpected error<br>");	
    		
			e.printStackTrace();
		}    	
  	  return "redirect:/profile";	
    }
	
	@GetMapping("setasprofile")
	String setprofile(RedirectAttributes red, 
			@RequestParam String email, @RequestParam String image, Model model) {			    	
    	
    	try {				
    		Customers customer= customerRepository.findByEmail(email);
    		customer.setImage(image);
    		customerRepository.save(customer);
    		red.addFlashAttribute("success", "Image set to "+ image);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
	    return "redirect:/profile";		
	}
	
	@GetMapping("deleteimage")
	String removeImage(RedirectAttributes red, @RequestParam long id,
			@RequestParam String image, Model model) {			    	
    	
    	try {				
    		serviceUtils.removefiles(id, image);
    		red.addFlashAttribute("success", "Image deleted");
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
	    return "redirect:/profile";		
	}
	
}
