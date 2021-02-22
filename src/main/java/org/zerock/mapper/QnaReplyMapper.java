package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;


public interface QnaReplyMapper {

	public List<QnaReplyVO> getList();
	
	public int insert(QnaReplyVO vo);
		
	public QnaReplyVO read(Long bno);
	
	public int delete(Long ano);
	
	public int update(QnaReplyVO reply);
	
	public List<QnaReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
}
