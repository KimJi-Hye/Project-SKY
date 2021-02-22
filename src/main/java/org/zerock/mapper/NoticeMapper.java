package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(NoticeVO board);
		
	public NoticeVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(NoticeVO board);
}
