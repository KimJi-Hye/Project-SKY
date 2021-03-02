package org.zerock.service;


import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.NoteReplyPageDTO;
import org.zerock.domain.NoteReplyVO;




public interface NoteReplyService {

	public int register(NoteReplyVO vo);
	
	public NoteReplyVO get(Long bno);
	
	public int modify(NoteReplyVO vo);
	
	public int remove(Long bno);
	
	public List<NoteReplyVO> getList(Criteria cri, Long bno);
	
<<<<<<< HEAD
	public NoteReplyPageDTO getListPage(Criteria cri, Long bno);
=======
	
	//public ReplyPageDTO getListPage(Criteria cri, Long bno);
>>>>>>> branch 'develop' of https://github.com/KimJi-Hye/Project-SKY.git
}
