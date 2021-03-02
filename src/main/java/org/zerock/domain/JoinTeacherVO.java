package org.zerock.domain;

import lombok.Data;

@Data
public class JoinTeacherVO {
	
	// 선생님 테이블
	private String userId;
	private String auth;
	private String classname;
	private String userName;
	private String userPw;
	private String userBirth;
	private String userPhone;
	private String userAddr;
	private String userEmail;
	private String userType;
	
}
