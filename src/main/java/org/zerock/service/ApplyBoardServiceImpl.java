package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.ApplyBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ApplyBoardServiceImpl implements ApplyBoardService{

	//spring 4.3 이상에서 자동 처리
	private ApplyBoardMapper mapper;
	
	@Override
	public void register(ApplyBoardVO board) {
	
		log.info("register......" + board);
		
		mapper.insert(board);
	}
	
//	@Override
//	public List<ApplyBoardVO> getList() {
//
//		log.info("getList.........");
//		
//		return mapper.getList();
//	}

	
	@Override
	public List<ApplyBoardVO> getList(Criteria cri) {
		
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public ApplyBoardVO get(Long ano) {

		log.info("get......" + ano);
		
		return mapper.read(ano);
	}

	@Override
	public boolean modify(ApplyBoardVO board) {

		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
	}
	
	@Override
	public boolean update(ApplyBoardVO board) {

		log.info("pass......" + board);
		
		return mapper.pass(board) == 1;
	}	

	@Override
	public boolean remove(Long ano) {

		log.info("remove...." + ano);
		
		return mapper.delete(ano) == 1;
	}

	@Override
	public ApplyBoardVO success(String useremail) {

		
		log.info("success...." + useremail);
		
		return mapper.success(useremail);
	}
	
	@Override
	public String anoCheck(Long ano) {
		String cnt = mapper.anoCheck(ano);
		return cnt;
	}

	@Override
	public String emailCheck(String userEmail) {

		String cnt = mapper.emailCheck(userEmail);
		return cnt;
	}


}
