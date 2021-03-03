package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.Criteria;

public interface ApplyBoardMapper {

	public List<ApplyBoardVO> getList();
	
	public List<ApplyBoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(ApplyBoardVO board);
		
	public ApplyBoardVO read(Long ano);
	
	public int delete(Long ano);
	
	public int update(ApplyBoardVO board);
	
	public int pass(ApplyBoardVO board);
	
	public ApplyBoardVO success(String useremail);
	
	public String anoCheck(Long ano);
	
	public String emailCheck(String userEmail);
	
}
