package com.yummyclimbing.vo.mountain;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.Data;

@Data
@JacksonXmlRootElement(localName="body")
public class MountainPositionBodyVO {
	@JacksonXmlProperty(localName="items")
	private List<MountainPositionItemVO> items;
	@JacksonXmlProperty(localName="pageNo")
	private int pageNo;
	@JacksonXmlProperty(localName="numOfRows")  
	private int numOfRows;
	@JacksonXmlProperty(localName="totalCount") 
	private int totalCount;
}
