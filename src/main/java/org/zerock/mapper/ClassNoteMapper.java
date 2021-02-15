package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.ClassMngVO;
import org.zerock.domain.ClassNoteVO;

public interface ClassNoteMapper {
	
	//@Select("select * from tb_note board where bno > 0")
	public List<ClassNoteVO> getList();
	
	public void insert(ClassNoteVO board);
	
	public void insertSelectKey(ClassNoteVO board);
		
	public ClassNoteVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassNoteVO board);

}
