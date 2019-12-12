package com.webapp.myalumniroster.service;

import java.util.List;
import java.util.Optional;

import com.webapp.myalumniroster.model.Customers;

public interface CustomerService {

	Customers findByEmail(String email);
	Optional<Customers> findById(long id);
	List<Customers> findAll();
	List<Customers> findByName(String name);
	void giveRole(long id, String role);
	void save(Customers customers);
	void delete(long id);
	void update(Customers customers);
	
}
