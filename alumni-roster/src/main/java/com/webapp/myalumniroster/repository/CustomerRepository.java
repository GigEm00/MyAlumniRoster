package com.webapp.myalumniroster.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.webapp.myalumniroster.model.Customers;

@Repository
public interface CustomerRepository extends JpaRepository<Customers, Long> {
  
	String searchByName="SELECT * FROM Customers c WHERE c.lname LIKE :name OR c.fname = :name";
	
	Customers findByEmail(String email);
	//@Query("FROM Customers WHERE lname LIKE ?1 OR fname=?1")
	@Query(value =searchByName, nativeQuery = true) 
	List<Customers> findByName(@Param("name") String name);
	
}
