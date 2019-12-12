package com.webapp.myalumniroster.dto;

public class DraftedDto {

	private Integer year;
	private KeyDto team;
	private KeyDto pickTeam;
	private Integer round;
	private Integer roundPick;
	private Integer overallPick;
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public KeyDto getTeam() {
		return team;
	}
	public void setTeam(KeyDto team) {
		this.team = team;
	}
	public KeyDto getPickTeam() {
		return pickTeam;
	}
	public void setPickTeam(KeyDto pickTeam) {
		this.pickTeam = pickTeam;
	}
	public Integer getRound() {
		return round;
	}
	public void setRound(Integer round) {
		this.round = round;
	}
	public Integer getRoundPick() {
		return roundPick;
	}
	public void setRoundPick(Integer roundPick) {
		this.roundPick = roundPick;
	}
	public Integer getOverallPick() {
		return overallPick;
	}
	public void setOverallPick(Integer overallPick) {
		this.overallPick = overallPick;
	}
	
	
	
}
