package com.yummyclimbing.rest;

import java.net.URI;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Rest {
	@Autowired
	private RestTemplate restTemplate;
			
	public <T> T getData(String url, Class<T> clazz, Map<String, Object> parameter) {
		try {
			String allUrl = generateUrl(url, parameter);
			URI uri = new URI(allUrl);
			ResponseEntity<T> response = restTemplate.getForEntity(uri, (Class<T>) clazz);
			if(response.getStatusCode() == HttpStatus.OK) {
				return response.getBody();
			} else {
				log.error("error=>{}", response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String generateUrl(String url, Map<String, Object> parameter) {
		if(parameter != null) {
			if(url.indexOf("?") == -1) {
				url += "?";
			}
			Iterator<String> iterator = parameter.keySet().iterator();
			while(iterator.hasNext()) {
				String key = iterator.next();
				Object value = parameter.get(key);
				url += "&" + key + "=" + value;
			}
		}
		log.debug(url);
		return url;
	}
}
