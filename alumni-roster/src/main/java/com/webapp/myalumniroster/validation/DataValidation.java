package com.webapp.myalumniroster.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.webapp.myalumniroster.model.Customers;
import com.webapp.myalumniroster.repository.CustomerRepository;

@Component
public class DataValidation implements Validator {
	
	@Autowired
	public CustomerRepository customerRepository;
	
	String emailRegex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	
	public boolean supports(Class<?> clazz) {
		return Customers.class.equals(clazz);
	}

	public void validate(Object o, Errors errors) {
		Customers customers = (Customers) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lname", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fname", "NotEmpty");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");		
		if (customerRepository.findByEmail(customers.getEmail()) !=null) {
	    	errors.rejectValue("email", "size.user.unique");
	    }
		
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (customers.getPassword().length() <=0  ||  customers.getPassword().length() < 4) {
	    	errors.rejectValue("password", "size.user.password");
	    }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "NotEmpty");
        if (!customers.getPassword2().equals(customers.getPassword())) {
	    	errors.rejectValue("password2", "match.user.password");
	    }
        
        if (!customers.getEmail().matches(emailRegex)) {
        	errors.rejectValue("email", "size.user.email");
	    }
		
	}
}