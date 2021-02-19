package org.zerock.service;

import java.util.List;

import org.zerock.domain.AuthorVO;

public interface AuthorService {
	
	public void register(AuthorVO author);
	
	public AuthorVO get(char atgrade);
	
	public boolean modify(AuthorVO author);
	
	public boolean remove(char atgrade);
	
	public List<AuthorVO> getList();

}
