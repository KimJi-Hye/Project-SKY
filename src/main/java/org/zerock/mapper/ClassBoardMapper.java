package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ClassBoardVO;

public interface ClassBoardMapper {

//	@Select("select * from tb_class")
	public List<ClassBoardVO> getList();
	
	public void insert(ClassBoardVO board);
	
	public void insertSelectKey(ClassBoardVO board);
		
	public ClassBoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassBoardVO board);
}
