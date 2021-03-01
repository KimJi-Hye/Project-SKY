package org.zerock.domain;

import lombok.Data;

@Data
public class JoinParentsVO {
	
	// 학부모
	private String userId;
	private String auth;
	private String userName;
	private String userPw;
	private String userBirth;
	private String userPhone;
	private String userAddr;
	private String userEmail;
	private String userType;
	private String relation;
	
	// 접수유형
	private String apptype;
	
	// 아동
	private String cunicode;
	private String classname;
	private String cname;
	private String cbirth;
		
}
