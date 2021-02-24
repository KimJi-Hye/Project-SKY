package org.zerock.service;

import java.util.List;

import org.zerock.domain.EventBoardVO;

public interface EventBoardService {

	public int register(EventBoardVO board);
	
	public EventBoardVO get(Long bno);
	
	public int modify(EventBoardVO board);
	
	public int remove(Long bno);
	
	public List<EventBoardVO> getList();
	
}
