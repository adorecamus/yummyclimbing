package com.yummyclimbing.vo.mountain;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.Data;

@Data
@JacksonXmlRootElement(localName="item")
public class MountainPositionItemVO {
	@JacksonXmlProperty(localName="frtrlNm")
	private String frtrlNm; // 숲길명
	@JacksonXmlProperty(localName="placeNm")
	private String placeNm; // 장소유형
	@JacksonXmlProperty(localName="lat")
	private Float lat; // 위도
	@JacksonXmlProperty(localName="lot")
	private Float lot; // 경도
	
	//----------미사용 field-------//
//	@JacksonXmlProperty(localName="poiId")
//	private String poiId; // 관심지점식별자
//	@JacksonXmlProperty(localName="frtrlId")
//	private String frtrlId; // 숲길식별자
//	@JacksonXmlProperty(localName="aslAltide")
//	private float aslAltide; // 해발고도
//	@JacksonXmlProperty(localName="orgnPlaceTpeNm")
//	private String orgnPlaceTpeNm; // 원천장소 유형명
//	@JacksonXmlProperty(localName="dscrtCn")
//	private String dscrtCn; // 설명내용
//	@JacksonXmlProperty(localName="orgnExmnnPrgrsDrcntNm")
//	private String orgnExmnnPrgrsDrcntNm; //원천조사진행방향명
//	@JacksonXmlProperty(localName="sgnpstDstn1Nm")
//	private String sgnpstDstn1Nm; // 이정표목적지1명
//	@JacksonXmlProperty(localName="orgnSgnpstDstn1DrcntNm")
//	private String orgnSgnpstDstn1DrcntNm; // 원천이정표목적지1방향명
//	@JacksonXmlProperty(localName="sgnpstDstn2Nm")
//	private String sgnpstDstn2Nm; // 이정표목적지2명
//	@JacksonXmlProperty(localName="orgnSgnpstDstn2DrcntNm")
//	private String orgnSgnpstDstn2DrcntNm; // 원천이정표목적지2방향명
//	@JacksonXmlProperty(localName="sgnpstDstn3Nm")
//	private String sgnpstDstn3Nm; // 이정표목적지3명
//	@JacksonXmlProperty(localName="orgnSgnpstDstn3DrcntNm")
//	private String orgnSgnpstDstn3DrcntNm; // 원천이정표목적지3방향명
//	@JacksonXmlProperty(localName="sgnpstDstn4Nm")
//	private String sgnpstDstn4Nm; // 이정표목적지4명
//	@JacksonXmlProperty(localName="orgnSgnpstDstn4DrcntNm")
//	private String orgnSgnpstDstn4DrcntNm; // 원천이정표목적지4방향명
//	@JacksonXmlProperty(localName="orgnPlaceTpeCd")
//	private String orgnPlaceTpeCd; // 원천장소유형코드
//	@JacksonXmlProperty(localName="orgnSgnpstDstn1DrcntCd")
//	private String orgnSgnpstDstn1DrcntCd; // 원천이정표목적지1코드
//	@JacksonXmlProperty(localName="orgnSgnpstDstn2DrcntCd")
//	private String orgnSgnpstDstn2DrcntCd; // 원천이정표목적지2
//	@JacksonXmlProperty(localName="orgnSgnpstDstn3DrcntCd")
//	private String orgnSgnpstDstn3DrcntCd; // 원천이정표목적지3코드
//	@JacksonXmlProperty(localName="orgnSgnpstDstn4DrcntCd")
//	private String orgnSgnpstDstn4DrcntCd; // 원천이정표목적지4코드
//	@JacksonXmlProperty(localName="crtrDt")
//	private String crtrDt; // 기준일시
	//-------------------------------------//
}
