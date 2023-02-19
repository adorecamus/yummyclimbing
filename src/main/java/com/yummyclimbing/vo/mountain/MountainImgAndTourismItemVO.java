package com.yummyclimbing.vo.mountain;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.Data;

@Data
@JacksonXmlRootElement(localName="item")
public class MountainImgAndTourismItemVO {
	@JacksonXmlProperty(localName="mntnid")
	private String mntnid; // 산id
	@JacksonXmlProperty(localName="mntnnm")
	private String mntnnm; // 산이름
	@JacksonXmlProperty(localName="mntnattchimageseq")
	private String mntnattchimageseq; // 산정보이미지	
	@JacksonXmlProperty(localName="pbtrninfodscrt")
	private String pbtrninfodscrt; // 대중교통정보설명(교통정보 대중교통)	
	
	//---------------미사용 field-------------------//
//	@JacksonXmlProperty(localName="crcmrsghtngetcimageseq")
//	private String crcmrsghtngetcimageseq; // 주변관광정보이미지
//	@JacksonXmlProperty(localName="crcmrsghtnginfodscrt")
//	private String crcmrsghtnginfodscrt; // 주변관광정보설명
//	@JacksonXmlProperty(localName="crcmrsghtnginfoetcdscrt")
//	private String crcmrsghtnginfoetcdscrt; // 산정보주변관광정보기타코스설명
//	@JacksonXmlProperty(localName="hkngpntdscrt")
//	private String hkngpntdscrt; // 산행포인트설명
//	@JacksonXmlProperty(localName="hndfmsmtnmapimageseq")
//	private String hndfmsmtnmapimageseq; // 100대명산 지도명(이미지)
//	@JacksonXmlProperty(localName="hndfmsmtnslctnrson")
//	private String hndfmsmtnslctnrson;
//	@JacksonXmlProperty(localName="mntninfodscrt")
//	private String mntninfodscrt; // 산정보개관(개관)	
//	@JacksonXmlProperty(localName="mntninfodtlinfocont")
//	private String mntninfodtlinfocont; // 상세정보내용(상세정보)
//	@JacksonXmlProperty(localName="mntninfohght")
//	private String mntninfohght; // 산정보 높이	
//	@JacksonXmlProperty(localName="mntninfomapdnldfilenm")
//	private String mntninfomapdnldfilenm; // 산정보지도다운로드파일
//	@JacksonXmlProperty(localName="mntninfomngmemnbdnm")
//	private String mntninfomngmemnbdnm; // 산정보관리주체명(관리주체)	
//	@JacksonXmlProperty(localName="mntninfopoflc")
//	private String mntninfopoflc; // 산정보소재지(소재지)	
//	@JacksonXmlProperty(localName="mntninfotrnspinfoimageseq")
//	private String mntninfotrnspinfoimageseq; // 교통정보이미지
//	@JacksonXmlProperty(localName="mntnsbttlinfo")
//	private String mntnsbttlinfo; // 산정보부제
//	@JacksonXmlProperty(localName="ptmntrcmmncoursdscrt")
//	private String ptmntrcmmncoursdscrt; // 대중교통정보설명(교통정보 대중교통) 미사용필드 
//	@JacksonXmlProperty(localName="rcmmncoursimageseq")
//	private String rcmmncoursimageseq; // 추천코스이미지
	//---------------미사용 field-------------------//
	
}
