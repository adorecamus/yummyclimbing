package com.yummyclimbing.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@ToString
public class ErrorVO {
	
	private Date date;
	private String message;
	private String descrption;
	private int errorCode;

}