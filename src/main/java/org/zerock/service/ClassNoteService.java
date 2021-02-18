package org.zerock.service;

import java.util.List;

import org.zerock.domain.ClassNoteVO;

public interface ClassNoteService {
	
	public void register(ClassNoteVO board);
	
	public ClassNoteVO get(Long bno);
	
	public boolean modify(ClassNoteVO board);
	
	public boolean remove(Long bno);
	
	public List<ClassNoteVO> getList();

}
