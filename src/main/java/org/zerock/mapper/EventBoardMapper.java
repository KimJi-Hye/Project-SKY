package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.EventBoardVO;
import org.zerock.domain.QnaReplyVO;

public interface EventBoardMapper {

	public List<EventBoardVO> getList();
	
	public int insert(EventBoardVO board);
		
	public EventBoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(EventBoardVO board);
	
}
