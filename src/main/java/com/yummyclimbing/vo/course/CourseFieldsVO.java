package com.yummyclimbing.vo.course;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class CourseFieldsVO {
	private String name;
	private String type;
	private String alias;
	private String length;
}
