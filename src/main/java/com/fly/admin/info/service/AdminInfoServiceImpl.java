package com.fly.admin.info.service;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.converter.json.JsonbHttpMessageConverter;
import org.springframework.stereotype.Service;

@Service
public class AdminInfoServiceImpl implements AdminInfoService {

	@Override
	public Map<String, Object> getEditor(HashMap<String, String> hMap) throws Exception {
		
		JsonbHttpMessageConverter jsonData = new JsonbHttpMessageConverter();
		
		// url 호출
		
		return null;
	}



}
