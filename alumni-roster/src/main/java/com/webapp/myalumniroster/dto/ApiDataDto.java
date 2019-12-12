package com.webapp.myalumniroster.dto;

import java.util.List;

public class ApiDataDto {

	private List<PlayerDto> players;
	private String lastUpdatedOn;
	
	
	
	
	public List<PlayerDto> getPlayers() {
		return players;
	}
	public void setPlayers(List<PlayerDto> players) {
		this.players = players;
	}
	public String getLastUpdatedOn() {
		return lastUpdatedOn;
	}
	public void setLastUpdatedOn(String lastUpdatedOn) {
		this.lastUpdatedOn = lastUpdatedOn;
	}
	
	
}
