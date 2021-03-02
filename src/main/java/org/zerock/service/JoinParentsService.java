package org.zerock.service;

import java.util.List;

import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.JoinParentsVO;

public interface JoinParentsService {
	
	public void join(JoinParentsVO join);
	
	public JoinParentsVO get(String userId);
	
	public ApplyBoardVO getParents(String cunicode);
	
	public List<ApplyBoardVO> getApplyList();
	
	public boolean modify(JoinParentsVO join);
	
	public boolean remove(String userId);
	
	public List<JoinParentsVO> getList();
	
	public int idCheck(String userId);
	
}
