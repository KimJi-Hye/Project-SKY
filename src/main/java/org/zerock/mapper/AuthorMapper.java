package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AuthorVO;

public interface AuthorMapper {
	
	public List<AuthorVO> getList();
	
	public void insert(AuthorVO author);
	
	public AuthorVO read(String auth);
	
	public int update(AuthorVO author);
	
	public int delete(String auth);
	
}
