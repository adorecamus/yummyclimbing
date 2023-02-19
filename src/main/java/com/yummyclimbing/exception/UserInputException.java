package com.yummyclimbing.exception;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserInputException extends IllegalArgumentException {
	private static final long serialVersionUID = 1L;
	private String msg;

	public UserInputException(Exception e) {
		super(e);
	}
	
	public UserInputException(String msg) {
		super(msg);
		this.msg = msg;
	}
}
