package com.yummyclimbing.vo.course;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data

@JsonIgnoreProperties(ignoreUnknown = true)
public class CourseValuesVO {
	CourseAliasesVO attributes;
	CouresGeometryVO geometry;
}
