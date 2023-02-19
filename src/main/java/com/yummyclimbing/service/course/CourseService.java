package com.yummyclimbing.service.course;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.exc.StreamReadException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yummyclimbing.vo.course.CourseResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CourseService {
	public void getCourseInfoFromJson() throws StreamReadException, DatabindException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		CourseResponseVO res = objectMapper.readValue(new File("/src/main/resources/json/PMNTN_도봉산_자운봉_113200102.json"), CourseResponseVO.class);
		
		log.debug("res=>{}",res);
	}
	
}