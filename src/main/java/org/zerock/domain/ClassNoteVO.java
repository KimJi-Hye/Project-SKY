package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClassNoteVO {

	private Long bno;
	private String className;
	private String cUnicode;
	private String cname;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	
	
}
