package com.yummyclimbing.vo.mountain;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.Data;

@Data
@JacksonXmlRootElement(localName="header") // headerVO는 공통
public class MountainHeaderVO {
	@JacksonXmlProperty(localName="resultCode")
	private String resultCode;
	@JacksonXmlProperty(localName="resultMsg")
	private String resultMsg;
}
