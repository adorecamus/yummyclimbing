package com.yummyclimbing.vo.course;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class CourseAttributeVO {
	private int fid;
	private int pmntnSn; // 등산로 순번
	private String mntnCode; // 산코드
	private String mntnNm; // 산명
	private String pmntnNm; // 등산로명
	private String pmntnMain; // 등산로주요지점내용
	private float pmntnLt; // 등산로길이
	private String pmntnDffl; //	등산로난이도명
	private int pmntnUppl; // 등산로상행시간
	private int pmntnGodn; // 등산로하행시간
	private String pmntnMtrq; //	등산로재질내용
	private String pmntnCnrl; // 등산로통제여부
	private String pmntnCls_; //	등산로폐쇄여부
	private String pmntnRisk; // 등산로위험구간내용
	private String pmntn_reco; // 등산로추천여부
	private String dataStdr_; //	데이터기준일자
	private String mntnId; // 산id

	private int mcNum;
	private String mcCredat;
}
