package com.yummyclimbing.vo.mountain;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.Data;

@Data
@JacksonXmlRootElement(localName="response")
public class MountainPositionResponseVO {
	@JacksonXmlProperty(localName="header")
	private MountainHeaderVO header;
	@JacksonXmlProperty(localName="body")
	private MountainPositionBodyVO body;
}
