package com.yummyclimbing.vo.course;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
@Slf4j
public class CourseResponseVO {
	private String displayFieldName;
	private String geometryType;
	private CourseSpatialReferenceVO spatialReference;
	private List<CourseFieldsVO> fields;
	private List<CourseValuesVO> features;

}
