package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.ClassPhotoVO;
import org.zerock.domain.Criteria;

public interface ClassPhotoService {

	public void register(ClassPhotoVO board);
	
	public ClassPhotoVO get(Long bno);
	
	public boolean modify(ClassPhotoVO board);
	
	public boolean remove(Long bno);
	
//	public List<ClassPhotoVO> getList();

	public List<ClassPhotoVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);	
	
	public List<BoardAttachVO> getAttachList(Long bno);
}
