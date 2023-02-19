package com.yummyclimbing.vo.mountain;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.Data;

@Data
@JacksonXmlRootElement(localName="item")
public class MountainInfoItemVO {
	private int miNum; // P.K.
	private String miCredat; // 생성일자
	private String miLmodat; // 업데이트 일자
	@JacksonXmlProperty(localName="mntnattchimageseq")
	private String mntnattchimageseq; // 산정보이미지	
	@JacksonXmlProperty(localName="transport")
	private String transport; // 대중교통정보
	@JacksonXmlProperty(localName="lat")
	private Float lat; // latitude(위도)
	@JacksonXmlProperty(localName="lot")
	private Float lot; // longitude(경도)
	private Float dist; // 거리계산 저장할 field
	
	//---------- API Field---------//
	@JacksonXmlProperty(localName="aeatreason")
	private String aeatreason; // 100대산 선정 이유
	@JacksonXmlProperty(localName="areanm")
	private String areanm; // 산 지역
	@JacksonXmlProperty(localName="details")
	private String details; // 산 정보
	@JacksonXmlProperty(localName="etccourse") 
	private String etccourse; // 다른 코스
	@JacksonXmlProperty(localName="mntheight") 
	private int mntheight; // 산 높이
	@JacksonXmlProperty(localName="mntncd")
	private String mntncd; // 산코드
	@JacksonXmlProperty(localName="mntnm")
	private String mntnm; // 산이름 unique
	@JacksonXmlProperty(localName="overview")
	private String overview; // 설명 미리보기
	@JacksonXmlProperty(localName="subnm")
	private String subnm; // 부제
	@JacksonXmlProperty(localName="tourisminf")
	private String tourisminf; // 주변관광명소 
	//-----------------------------------//
	
	//------------미사용 API field----------//
//	@JacksonXmlProperty(localName="flashurl")
//	private String flashurl;
//	@JacksonXmlProperty(localName="videourl")
//	private String videourl; // other path column url
	//-------------미사용 field------------//
}
