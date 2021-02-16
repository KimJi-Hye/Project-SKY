package org.zerock.service;

import java.util.List;

import org.zerock.domain.ClassNoteVO;
import org.zerock.domain.Criteria;

public interface ClassNoteService {

	public void register(ClassNoteVO board);
	
	public ClassNoteVO get(Long bno);
	
	public boolean modify(ClassNoteVO board);
	
	public boolean update(ClassNoteVO board);
	
	public boolean remove(Long bno);
	
	public List<ClassNoteVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);	
}
