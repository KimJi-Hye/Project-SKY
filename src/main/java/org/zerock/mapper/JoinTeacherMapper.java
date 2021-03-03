package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.JoinTeacherVO;

public interface JoinTeacherMapper {

	public List<JoinTeacherVO> getList();
	
	public void insert(JoinTeacherVO board);
	
	public JoinTeacherVO read(String userId);
	
	public int update(JoinTeacherVO board);
	
	public int delete(String userId);
	
	public String emailCheck(String userEmail);
	
}
