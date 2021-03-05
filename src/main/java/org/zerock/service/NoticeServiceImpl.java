package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeVO;
import org.zerock.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

	//spring 4.3 이상에서 자동 처리
	private NoticeMapper mapper;
	
	@Override
	public void register(NoticeVO board) {
	
		log.info("register......" + board);
		
		mapper.insert(board);
	}
	
//	@Override
//	public List<NoticeVO> getList() {
//
//		log.info("getList.........");
//		
//		return mapper.getList();
//	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public NoticeVO get(Long ano) {

		log.info("get......" + ano);
		
		return mapper.read(ano);
	}

	@Override
	public boolean modify(NoticeVO board) {

		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long ano) {

		log.info("remove...." + ano);
		
		return mapper.delete(ano) == 1;
	}

	@Override
	public List<NoticeVO> getMainList() {
		
		log.info("main notice list");
		return mapper.getList();
	}


}
