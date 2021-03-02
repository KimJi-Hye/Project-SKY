package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.JoinParentsVO;

public interface JoinParentsMapper {

	public List<JoinParentsVO> getList();
	
	public void insert(JoinParentsVO board);
	
	public JoinParentsVO read(String userId);
	
	public ApplyBoardVO readParents(String cunicode);
	
	public List<ApplyBoardVO> applyList();
	
	public int update(JoinParentsVO borad);
	
	public int delete(String userId);
	
	public int idCheck(String userId);
	
}
