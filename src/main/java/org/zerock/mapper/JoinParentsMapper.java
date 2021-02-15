package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.JoinParentsVO;

public interface JoinParentsMapper {

	public List<JoinParentsVO> getList();
	
	public void insert(JoinParentsVO board);
	
	public JoinParentsVO read(String userId);
	
	public int update(JoinParentsVO borad);
	
	public int delete(String userId);
	
}
