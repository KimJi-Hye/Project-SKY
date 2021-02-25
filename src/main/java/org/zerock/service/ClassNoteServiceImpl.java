package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.ClassNoteVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.ClassNoteMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClassNoteServiceImpl implements ClassNoteService {
	
	@Setter(onMethod_ = @Autowired)
	private ClassNoteMapper mapper;

	@Override
	public void register(ClassNoteVO board) {
		
		log.info("register....." + board);
		
		mapper.insertSelectKey(board);
		
	}
	
//	@Override
//	public List<ClassNoteVO> getList() {
//
//		log.info("getList.....");
//		
//		return mapper.getList();
//	}

	@Override
	public List<ClassNoteVO> getList(Criteria cri) {
		
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<ChildBoardVO> getChildList() {
		log.info("Get Child List");
		return mapper.getChildList();
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public ClassNoteVO get(Long bno) {

		log.info("get......." + bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ClassNoteVO board) {

		log.info("modify....." + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove....." + bno);
		
		return mapper.delete(bno) == 1;
	}


	

}
