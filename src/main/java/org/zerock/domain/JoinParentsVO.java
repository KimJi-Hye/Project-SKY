package org.zerock.domain;

import lombok.Data;

@Data
public class JoinParentsVO {
	
	// 학부모
	private String userId;
	private char atGrade;
	private String userName;
	private String userPw;
	private String userPhone;
	private String userAddr;
	private String userEmail;
	private char userType;
	
	// 아동
	private String cUnicode;
	private String className;
	private String cName;
	private String cBirth;
	
}
