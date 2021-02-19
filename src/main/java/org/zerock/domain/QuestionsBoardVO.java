package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionsBoardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	private String pw;
	
}
