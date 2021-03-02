package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoteReplyPageDTO;
import org.zerock.domain.NoteReplyVO;
import org.zerock.mapper.NoteReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoteReplyServiceImpl implements NoteReplyService{

	//spring 4.3 이상에서 자동 처리
	@Setter(onMethod_ = @Autowired)
	private NoteReplyMapper mapper;
	
	@Override
	public int register(NoteReplyVO vo) {
	
		log.info("register......" + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public NoteReplyVO get(Long ano) {

		log.info("get......" + ano);
		
		return mapper.read(ano);
	}

	@Override
	public int modify(NoteReplyVO vo) {

		log.info("modify......" + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long ano) {

		log.info("remove...." + ano);
		
		return mapper.delete(ano);
	}

	@Override
	public List<NoteReplyVO> getList(Criteria cri, Long bno) {

		log.info("get Reply List of a Board " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public NoteReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new NoteReplyPageDTO(
			mapper.getCountByBno(bno),
			mapper.getListWithPaging(cri, bno));
	}
}
