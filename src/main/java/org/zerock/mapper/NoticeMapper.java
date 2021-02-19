package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();
	
	public void insert(NoticeVO board);
	
	public void insertSelectKey(NoticeVO board);
		
	public NoticeVO read(Long ano);
	
	public int delete(Long ano);
	
	public int update(NoticeVO board);
}
