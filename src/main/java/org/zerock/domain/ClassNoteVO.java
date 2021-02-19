package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClassNoteVO {

	private Long bno;
	private Long rn;
	private String classname;
	private String cunicode;
	private String cname;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
		
	

}
