package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChildBoardVO {
	
	//원아테이블
	private String cunicode;
	private String cgender;
	private String cname;
	private String cbirth;
	private String enter;
	private String graduation;
	
	//학부모 테이블
	private String username;
	
	//반 테이블
	private String classname;

}
