package org.zerock.service;

import java.util.List;

import org.zerock.domain.ApplyBoardVO;

public interface ApplyBoardService {

	public void register(ApplyBoardVO board);
	
	public ApplyBoardVO get(Long ano);
	
	public boolean modify(ApplyBoardVO board);
	
	public boolean remove(Long ano);
	
	public List<ApplyBoardVO> getList();
}
