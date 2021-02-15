package org.zerock.domain;

import lombok.Data;

@Data
public class ChildBoardVO {
	
	//원아테이블
	private String cUnicode;
	private String cName;
	private String cBirth;
	
	//학부모 테이블
	private String userName;
	
	//반 테이블
	private String className;
}
