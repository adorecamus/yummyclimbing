package com.yummyclimbing.vo.course;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data

@JsonIgnoreProperties(ignoreUnknown = true)
public class CourseAliasesVO {
	private String FID;
	private String PMNTN_SN; // 등산로 순번
	private String MNTN_CODE; // 산코드
	private String MNTN_NM; // 산명
	private String PMNTN_NM; // 등산로명
	private String PMNTN_MAIN; // 등산로주요지점내용
	private String PMNTN_LT; // 등산로길이
	private String PMNTN_DFFL; //	등산로난이도명
	private String PMNTN_UPPL; // 등산로상행시간
	private String PMNTN_GODN; // 등산로하행시간
	private String PMNTN_MTRQ; //	등산로재질내용
	private String PMNTN_CNRL	; // 등산로통제여부
	private String PMNTN_CLS_; //	등산로폐쇄여부
	private String PMNTN_RISK; // 등산로위험구간내용
	private String PMNTN_RECO; // 등산로추천여부
	private String DATA_STDR_; //	데이터기준일자
	private String MNTN_ID; // 산id
}
