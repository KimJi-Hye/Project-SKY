package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.JoinTeacherVO;
import org.zerock.mapper.JoinTeacherMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class JoinTeacherServiceImpl implements JoinTeacherService {
	
	private JoinTeacherMapper mapper;

	@Override
	public void register(JoinTeacherVO join) {
		log.info("register....Join......." + join);
		mapper.insert(join);
	}

	@Override
	public JoinTeacherVO get(String userId) {
		log.info("get........" + userId);
		return mapper.read(userId);
	}

	@Override
	public boolean modify(JoinTeacherVO join) {
		log.info("modify....." + join);
		return mapper.update(join) == 1;
	}

	@Override
	public boolean remove(String userId) {
		log.info("remove....." + userId);
		return mapper.delete(userId) == 1;
	}

	@Override
	public List<JoinTeacherVO> getList() {
		log.info("getList...........");
		return mapper.getList();
	}

}
