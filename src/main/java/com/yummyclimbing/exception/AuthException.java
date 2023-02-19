package com.yummyclimbing.exception;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AuthException extends RuntimeException{
	private static final long serialVersionUID = 1L;
	private String msg;

	public AuthException(Exception e) {
		super(e);
	}
	
	public AuthException(String msg) {
		super(msg);
		this.msg = msg;
	}
}
