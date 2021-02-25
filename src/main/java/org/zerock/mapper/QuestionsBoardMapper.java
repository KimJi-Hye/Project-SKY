package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QuestionsBoardVO;

public interface QuestionsBoardMapper {

	public List<QuestionsBoardVO> getList();
	
	public List<QuestionsBoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(QuestionsBoardVO board);
	
	public void insertSelectKey(QuestionsBoardVO board);
		
	public QuestionsBoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(QuestionsBoardVO board);
}
