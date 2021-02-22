package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.EventBoardVO;

public interface EventBoardMapper {

	public List<EventBoardVO> getList();
	
	public void insert(EventBoardVO board);
		
	public EventBoardVO read(Long bno);
	
	public int delete(EventBoardVO board);
	
	public int delete(Long bno);
	
	public int update(EventBoardVO board);
}
