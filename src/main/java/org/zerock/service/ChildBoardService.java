package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.Criteria;


public interface ChildBoardService {

	public void register(ChildBoardVO board);
	
	public ChildBoardVO get(String cunicode);
	
	public boolean modify(ChildBoardVO board);
	
	public boolean remove(String cunicode);
	
//	public List<ChildBoardVO> getList();

	public List<ChildBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
