package com.webapp.myalumniroster.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webapp.myalumniroster.model.Customers;
import com.webapp.myalumniroster.repository.CustomerRepository;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository repository;
	
	
	@Override
	public Customers findByEmail(String email) {
		return repository.findByEmail(email);
	}

	@Override
	public Optional<Customers> findById(long id) {
		return repository.findById(id);
	}

	@Override
	public List<Customers> findAll() {
		return repository.findAll();
	}

	@Override
	public List<Customers> findByName(String name) {
		return repository.findByName(name);
	}

	@Override
	public void giveRole(long id, String role) {
		repository.findById(id).get().setRole(role);
	}

	@Override
	public void save(Customers customers) {
		repository.save(customers);
	}

	@Override
	public void delete(long id) {
		repository.delete(findById(id).get());
	}

	@Override
	public void update(Customers customers) {
		Customers user= findById(customers.getId()).get();
		if(user !=null) {
			user.setFname(customers.getFname());
			user.setLname(customers.getLname());
			user.setTel(customers.getTel());
			user.setState(customers.getState());
			user.setCollege(customers.getCollege());
		}
	}

}
