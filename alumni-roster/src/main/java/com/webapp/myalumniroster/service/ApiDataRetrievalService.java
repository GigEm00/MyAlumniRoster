package com.webapp.myalumniroster.service;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.webapp.myalumniroster.dto.ApiDataDto;
import com.webapp.myalumniroster.dto.PlayerDto;

@Service
public class ApiDataRetrievalService {
	private static final String API_KEY = "141ef627-9a60-4705-97cd-0e3d05:MYSPORTSFEEDS";
	private static final String API_URL = "https://api.mysportsfeeds.com/v2.1/pull/nfl/players.json";
	private static final String PLACEHOLDER_PLAYER_IMG = "https://image.flaticon.com/icons/png/512/46/46143.png";
	private RestTemplate restTemplate = new RestTemplate();

	public ApiDataDto retrievePlayerData() {

		Base64.Encoder encoder = Base64.getEncoder();

		String encodedString = encoder.encodeToString(API_KEY.getBytes(StandardCharsets.UTF_8));
		HttpHeaders headers = new HttpHeaders();

		headers.add("Authorization", "Basic " + encodedString);
		HttpEntity entity = new HttpEntity(headers);
		ResponseEntity<ApiDataDto> response = restTemplate.exchange(API_URL, HttpMethod.GET, entity, ApiDataDto.class);

		ApiDataDto data = response.getBody();
		data.setPlayers(data.getPlayers().stream()
				.filter(player -> player.getPlayer() != null && player.getPlayer().getCollege() != null)
				.collect(Collectors.toList()));

		return data;
	}

	public List<String> getColleges(ApiDataDto apiData) {
		List<String> colleges = new ArrayList<>();

		apiData.getPlayers().forEach(player -> {
			// add college to list
			if (!colleges.contains(player.getPlayer().getCollege())) {
				colleges.add(player.getPlayer().getCollege());
			}
		});
		colleges.sort(Comparator.naturalOrder());
		return colleges;
	}

	public List<PlayerDto> getUserPlayers(ApiDataDto apiData, String college) {
		if (college== null) {
			return new ArrayList<>();
		}

		return apiData.getPlayers().stream()
				.filter(player -> player.getPlayer() != null && college.equals(player.getPlayer().getCollege()))
				.map(player -> {
					if("".equals(player.getPlayer().getOfficialImageSrc()) || 
							player.getPlayer().getOfficialImageSrc() == null) {
						player.getPlayer().setOfficialImageSrc(PLACEHOLDER_PLAYER_IMG);
					}
					return player;
				})
				.collect(Collectors.toList());
	}

}
