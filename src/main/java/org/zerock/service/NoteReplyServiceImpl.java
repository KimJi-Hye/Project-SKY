package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoteReplyVO;
import org.zerock.mapper.NoteReplyMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoteReplyServiceImpl implements NoteReplyService{

	//spring 4.3 이상에서 자동 처리
	private NoteReplyMapper mapper;
	
	@Override
	public int register(NoteReplyVO vo) {
	
		log.info("register......" + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public NoteReplyVO get(Long rno) {

		log.info("get......" + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(NoteReplyVO vo) {

		log.info("modify......" + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {

		log.info("remove...." + rno);
		
		return mapper.delete(rno);
	}

	@Override
	public List<NoteReplyVO> getList(Criteria cri,Long bno) {

		log.info("get Reply List of a Board " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

}
