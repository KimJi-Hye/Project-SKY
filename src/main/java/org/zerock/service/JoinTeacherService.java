package org.zerock.service;

import java.util.List;

import org.zerock.domain.JoinTeacherVO;

public interface JoinTeacherService {
	
	public void register(JoinTeacherVO join);
	
	public JoinTeacherVO get(String userId);
	
	public boolean modify(JoinTeacherVO join);
	
	public boolean remove(String userId);
	
	public List<JoinTeacherVO> getList();
	
}
