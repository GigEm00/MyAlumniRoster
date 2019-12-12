package com.webapp.myalumniroster.model;

import javax.persistence.*;

import org.springframework.web.multipart.MultipartFile;

@Table(name="customers")
@Entity
public class Customers {
	
	    @Id	  
	    @GeneratedValue(strategy = GenerationType.AUTO)	  
	    @Column(name="id")
		private long id;
		private String email;
		private String password;
		private String lname;
		private String fname;
		private String tel;
		private String state;
		private String college;
		@Transient
		private String password2;	
		private String role;
		@Transient
		MultipartFile file;
		private String image;
		
		public long getId() {
		return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getLname() {
			return lname;
		}
		public void setLname(String lname) {
			this.lname = lname;
		}
		public String getFname() {
			return fname;
		}
		public void setFname(String fname) {
			this.fname = fname;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public String getPassword2() {
			return password2;
		}
		public void setPassword2(String password2) {
			this.password2 = password2;
		}
		
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		
		public MultipartFile getFile() {
			return file;
		}
		public void setFile(MultipartFile file) {
			this.file = file;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getCollege() {
			return college;
		}
		public void setCollege(String college) {
			this.college = college;
		}
		@Override
		public String toString() {
			return "Customers [id=" + id + ", email=" + email + ", password=" + password + ", lname=" + lname
					+ ", fname=" + fname + ", tel=" + tel + ", state=" + state + ", college=" + college + ", password2="
					+ password2 + ", role=" + role + ", file=" + file + ", image=" + image + "]";
		}

		
		
}
