package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.ClassPhotoVO;

public interface ClassPhotoService {

	public void register(ClassPhotoVO board);
	
	public ClassPhotoVO get(Long bno);
	
	public boolean modify(ClassPhotoVO board);
	
	public boolean remove(Long bno);
	
	public List<ClassPhotoVO> getList();
	
	public List<BoardAttachVO> getAttachList(Long bno);
}
