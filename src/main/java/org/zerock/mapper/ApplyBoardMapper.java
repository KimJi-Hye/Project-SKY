package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ApplyBoardVO;

public interface ApplyBoardMapper {

	public List<ApplyBoardVO> getList();
	
	public void insert(ApplyBoardVO board);
	
	public void insertSelectKey(ApplyBoardVO board);
		
	public ApplyBoardVO read(Long ano);
	
	public int delete(ApplyBoardVO board);
	
	public int delete(Long ano);
	
	public int update(ApplyBoardVO board);
	
	public int cupdate(ApplyBoardVO board);
}
