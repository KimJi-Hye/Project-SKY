package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoteReplyVO;


public interface NoteReplyMapper {
	
	public int insert(NoteReplyVO vo);
	
	public NoteReplyVO read(Long bno);
	
	public int delete (Long rno);
	
	public int update(NoteReplyVO reply);
	
	public List<NoteReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
		

}