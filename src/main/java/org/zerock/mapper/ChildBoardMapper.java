package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.Criteria;

public interface ChildBoardMapper {

	public List<ChildBoardVO> getList();
	
	public List<ChildBoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(ChildBoardVO board);
	
	public void insertSelectKey(ChildBoardVO board);
		
	public ChildBoardVO read(String cunicode);
	
	public int delete(String cunicode);
	
	public int update(ChildBoardVO board);
	
}
