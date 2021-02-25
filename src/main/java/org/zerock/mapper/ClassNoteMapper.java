package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.ClassNoteVO;
import org.zerock.domain.Criteria;

public interface ClassNoteMapper {

	public List<ClassNoteVO> getList();
	
	public List<ClassNoteVO> getListWithPaging(Criteria cri);
	
	public List<ChildBoardVO> getChildList();
	
	public int getTotalCount(Criteria cri);
	
	public void insert(ClassNoteVO board);
	
	public void insertSelectKey(ClassNoteVO board);
		
	public ClassNoteVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassNoteVO board);	

	
}
