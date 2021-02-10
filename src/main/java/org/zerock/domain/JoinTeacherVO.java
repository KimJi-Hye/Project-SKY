package org.zerock.domain;

import lombok.Data;

@Data
public class JoinTeacherVO {
	
	// 선생님 테이블 수정
	private String userId;
	private char atGrade;
	private String className;
	private String userName;
	private String userPw;
	private String userPhone;
	private String userAddr;
	private String userEmail;
	private char userType;
	
}
