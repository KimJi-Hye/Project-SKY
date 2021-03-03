package org.zerock.service;

import java.util.List;

import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.Criteria;

public interface ApplyBoardService {

	public void register(ApplyBoardVO board);
	
	public ApplyBoardVO get(Long ano);
	
	public boolean modify(ApplyBoardVO board);
	
	public boolean update(ApplyBoardVO board);
	
	public boolean remove(Long ano);
	
	public List<ApplyBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public ApplyBoardVO success(String useremail); 
	
	public String anoCheck(Long ano);
	
	public String emailCheck(String userEmail);

}
