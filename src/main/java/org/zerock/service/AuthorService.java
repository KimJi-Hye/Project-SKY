package org.zerock.service;

import java.util.List;

import org.zerock.domain.AuthorVO;

public interface AuthorService {
	
	public void register(AuthorVO author);
	
	public AuthorVO get(String auth);
	
	public boolean modify(AuthorVO author);
	
	public boolean remove(String auth);
	
	public List<AuthorVO> getList();

}
