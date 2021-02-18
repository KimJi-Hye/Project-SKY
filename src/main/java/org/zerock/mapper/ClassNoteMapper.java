package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.ClassNoteVO;
import org.zerock.domain.Criteria;

public interface ClassNoteMapper {
	
	//@Select("select * from tb_note board where bno > 0")
	public List<ClassNoteVO> getList();
	
	public List<ClassNoteVO> getListWithPaging(Criteria cri);	
	
	public int getTotalCount(Criteria cri);	
	
	public void insert(ClassNoteVO board);
	
	public void insertSelectKey(ClassNoteVO board);
		
	public ClassNoteVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassNoteVO board);

}
