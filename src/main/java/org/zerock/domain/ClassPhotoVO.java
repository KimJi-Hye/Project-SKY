package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ClassPhotoVO {

	private Long bno;
	private String className;
	private String title;
	private String content;
	private String tag;
	private String uuid;
	private String filename;
	

	
	private Date regdate;

	private List<BoardAttachVO> attachList;
}

