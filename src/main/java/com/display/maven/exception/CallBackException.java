package com.display.maven.exception;

/**
 * 事物回滚的抛出异常
 */
public class CallBackException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public CallBackException(String msg) {
		super(msg);
	}
	
}
