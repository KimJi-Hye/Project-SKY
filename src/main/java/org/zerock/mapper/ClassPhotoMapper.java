package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.ClassPhotoVO;

public interface ClassPhotoMapper {
	//@Select("select * from tb_photo where bno > 0")
	public List<ClassPhotoVO> getList();
	
	public void insert(ClassPhotoVO board);
	
	public void insertSelectKey(ClassPhotoVO board);
	
	public ClassPhotoVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ClassPhotoVO board);

}
