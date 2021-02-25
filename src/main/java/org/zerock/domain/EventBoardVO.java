package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EventBoardVO {

	private Long bno;
	private String title;
	private String content;
	private String color;
	private Date startdate;
	private Date endate;
	
}
