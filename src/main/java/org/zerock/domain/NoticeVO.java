package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private Long bno;
	private String title;
	private String contet;
	private Date regdate;
	private Date updatedate;
	
}
