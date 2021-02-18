package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoteReplyVO {

	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updatdDate;
	
}
