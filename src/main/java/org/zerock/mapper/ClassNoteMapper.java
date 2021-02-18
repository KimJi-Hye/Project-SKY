package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ClassNoteVO;

public interface ClassNoteMapper {

	public List<ClassNoteVO> getList();
	
	public void insert(ClassNoteVO board);
	
	public void insertSelectKey(ClassNoteVO board);
		
	public ClassNoteVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassNoteVO board);	
	
}
