package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.JoinParentsVO;
import org.zerock.mapper.JoinParentsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class JoinParentsServiceImpl implements JoinParentsService {
	
	private JoinParentsMapper mapper;

	// 등록
	@Override
	public void join(JoinParentsVO join) {
		log.info("Join......." + join);
		mapper.insert(join);
	}

	// 조회
	@Override
	public JoinParentsVO get(String userId) {
		log.info("get........" + userId);
		return mapper.read(userId);
	}
	
	// 원아접수 조회
	@Override
	public ApplyBoardVO getParents(String cunicode) {
		log.info("get Parents......" + cunicode);
		return mapper.readParents(cunicode);
	}

	// 수정
	@Override
	public boolean modify(JoinParentsVO join) {
		log.info("modify....." + join);
		return mapper.update(join) == 1;
	}

	// 삭제
	@Override
	public boolean remove(String userId) {
		log.info("remove....." + userId);
		return mapper.delete(userId) == 1;
	}

	// 리스트
	@Override
	public List<JoinParentsVO> getList() {
		log.info("getList...........");
		return mapper.getList();
	}

	// 원아접수 리스트
	@Override
	public List<ApplyBoardVO> getApplyList() {
		log.info("getApplyList...........");
		return mapper.applyList();
	}

	@Override
	public int idCheck(String userId) {
		int cnt = mapper.idCheck(userId);
		return cnt;
	}

}
