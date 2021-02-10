package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ClassApplyVO;
import org.zerock.domain.ClassBoardVO;

public interface ClassApplyMapper {

//	@Select("select * from tb_class")
	public List<ClassApplyVO> getList();
	
	public void insert(ClassApplyVO board);
	
	public void insertSelectKey(ClassApplyVO board);
		
	public ClassApplyVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassApplyVO board);
}
