package org.zerock.service;


import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.NoteReplyVO;




public interface NoteReplyService {

	public int register(NoteReplyVO vo);
	
	public NoteReplyVO get(Long rno);
	
	public int modify(NoteReplyVO vo);
	
	public int remove(Long rno);
	
	public List<NoteReplyVO> getList(Criteria cri,Long bno);
	
	//public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
