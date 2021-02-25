package org.zerock.service;

import java.util.List;

import org.zerock.domain.EventBoardVO;

public interface EventBoardService {

	public void register(EventBoardVO board);
	
	public EventBoardVO get(Long ano);
	
	public boolean modify(EventBoardVO board);
	
	public boolean remove(Long ano);
	
	public List<EventBoardVO> getList();
}
