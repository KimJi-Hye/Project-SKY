package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ClassMngVO;

public interface ClassMngMapper {

//	@Select("select * from tb_class")
	public List<ClassMngVO> getList();
	
	public void insert(ClassMngVO board);
	
	public void insertSelectKey(ClassMngVO board);
		
	public ClassMngVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassMngVO board);
}
