package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.ClassMngVO;
import org.zerock.domain.JoinTeacherVO;

public interface ClassMngMapper {

//	@Select("select * from tb_class")
	public List<ClassMngVO> getList();
	
	public List<ChildBoardVO> getChildList();
	
	public void insert(ClassMngVO board);
	
	public void insertSelectKey(ClassMngVO board);
		
	public ClassMngVO read(Long bno);
	
	public JoinTeacherVO readTeacher (Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassMngVO board);
}
