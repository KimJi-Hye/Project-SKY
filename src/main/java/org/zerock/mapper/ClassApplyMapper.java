package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ClassApplyVO;
import org.zerock.domain.ClassMngVO;

public interface ClassApplyMapper {

//	@Select("select * from tb_class")
	public List<ClassApplyVO> getList();
	
	public void insert(ClassApplyVO board);
	
	public void insertSelectKey(ClassApplyVO board);
		
	public ClassApplyVO read(Long ano);
	
	public int delete(ClassApplyVO board);
	
	public int delete(Long ano);
	
	public int update(ClassApplyVO board);
	
	public int cupdate(ClassApplyVO board);
}
