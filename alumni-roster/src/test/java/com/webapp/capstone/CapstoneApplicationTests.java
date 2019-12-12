package com.webapp.capstone;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.webapp.myalumniroster.model.Customers;
import com.webapp.myalumniroster.service.CustomerService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CapstoneApplicationTests {

	private final Logger log = LoggerFactory.getLogger(CapstoneApplicationTests.class);
	
	@Autowired
	private CustomerService customerService;
	
	String fname;
	String lname;
	String email;
	int x=10;
	int y=10;
	List<Customers> users;
	
	@Before
	public void setData() {
		this.email="ken.juma@yahoo.com";
		this.fname="Kennedy";
		this.lname="Aoro";	
		this.users= customerService.findAll();
	}
		
	@Test
	public void getByEmail() {
		  Customers user=customerService.findByEmail(email); 
		  log.info("############ user entity "+user.toString());		  
		  assertEquals(email, user.getEmail()); 
		  assertEquals(fname, user.getFname()); 
		  assertEquals(lname, user.getLname());
		  assertNotNull(user.getFname());
		  //assertNull(user.getFname());
		  assertFalse(user.getLname().isEmpty());
		  assertTrue(user !=null);
		  assertNotSame(user.getFname(), lname);
		}
	
		@Test
		public void calculator() {
		  assertEquals(100, multiply(x,y));
		  assertSame(x, y); 
		  assertEquals(11, divide(x,y));
		}
		
		int multiply(int x, int y) {		
			return x*y;
		}
		
		int divide(int x, int y) {
			return x/y;
		}

}
