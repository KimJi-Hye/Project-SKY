package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.ClassMngVO;
import org.zerock.domain.JoinTeacherVO;

public interface ClassMngService {

	public void register(ClassMngVO board);
	
	public ClassMngVO get(Long bno);
	
	public List<ChildBoardVO> getChildList();
	
	public JoinTeacherVO getTeacher (Long bno);
	
	public boolean modify(ClassMngVO board);
	
	public boolean remove(Long bno);
	
	public List<ClassMngVO> getList();
}
