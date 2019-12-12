package com.webapp.myalumniroster.dto;

public class PlayerInfoDto {

	 private Integer id;
     private String firstName;
     private String lastName;
     private String primaryPosition; 
     private Integer jerseyNumber;
     private KeyDto currentTeam;
	 private String currentRosterStatus;
//	 private String currentInjury;
	 private String height;
	 private Integer weight;
	 private String birthDate;
	 private Integer age;
	 private String birthCity;
	 private String birthCountry;
	 private Boolean rookie;
	 private String highSchool;
	 private String college;
//	 private String handedness;
	 private String officialImageSrc;
	 private Integer currentContractYear;
	 private DraftedDto drafted;
	
	 
	 
	 public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPrimaryPosition() {
		return primaryPosition;
	}
	public void setPrimaryPosition(String primaryPosition) {
		this.primaryPosition = primaryPosition;
	}
	public Integer getJerseyNumber() {
		return jerseyNumber;
	}
	public void setJerseyNumber(Integer jerseyNumber) {
		this.jerseyNumber = jerseyNumber;
	}
	public KeyDto getCurrentTeam() {
		return currentTeam;
	}
	public void setCurrentTeam(KeyDto currentTeam) {
		this.currentTeam = currentTeam;
	}
	public String getCurrentRosterStatus() {
		return currentRosterStatus;
	}
	public void setCurrentRosterStatus(String currentRosterStatus) {
		this.currentRosterStatus = currentRosterStatus;
	}
//	public String getCurrentInjury() {
//		return currentInjury;
//	}
//	public void setCurrentInjury(String currentInjury) {
//		this.currentInjury = currentInjury;
//	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public Integer getWeight() {
		return weight;
	}
	public void setWeight(Integer weight) {
		this.weight = weight;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getBirthCity() {
		return birthCity;
	}
	public void setBirthCity(String birthCity) {
		this.birthCity = birthCity;
	}
	public String getBirthCountry() {
		return birthCountry;
	}
	public void setBirthCountry(String birthCountry) {
		this.birthCountry = birthCountry;
	}
	public Boolean getRookie() {
		return rookie;
	}
	public void setRookie(Boolean rookie) {
		this.rookie = rookie;
	}
	public String getHighSchool() {
		return highSchool;
	}
	public void setHighSchool(String highSchool) {
		this.highSchool = highSchool;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
//	public String getHandedness() {
//		return handedness;
//	}
//	public void setHandedness(String handedness) {
//		this.handedness = handedness;
//	}
	public String getOfficialImageSrc() {
		return officialImageSrc;
	}
	public void setOfficialImageSrc(String officialImageSrc) {
		this.officialImageSrc = officialImageSrc;
	}
	public Integer getCurrentContractYear() {
		return currentContractYear;
	}
	public void setCurrentContractYear(Integer currentContractYear) {
		this.currentContractYear = currentContractYear;
	}
	public DraftedDto getDrafted() {
		return drafted;
	}
	public void setDrafted(DraftedDto drafted) {
		this.drafted = drafted;
	}
     
    		 
    		 
    		 
    		 
    		 
    		 
    		 
}
