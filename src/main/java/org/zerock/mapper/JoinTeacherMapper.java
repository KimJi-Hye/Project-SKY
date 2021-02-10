package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.JoinTeacherVO;

public interface JoinTeacherMapper {

	public List<JoinTeacherVO> getList();
	
	public void insert(JoinTeacherVO board);
	
}
