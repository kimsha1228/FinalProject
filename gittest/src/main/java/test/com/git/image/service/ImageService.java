package test.com.git.image.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.git.image.model.ImageDAO;
import test.com.git.image.model.ImageVO;

@Service
public class ImageService {

	@Autowired
	ImageDAO dao;
	
	public int insert(ImageVO vo) {
		return dao.insert(vo);
	}
	
	public int delete(ImageVO vo) {
		return dao.delete(vo);
	}

	public List<ImageVO> selectAll(ImageVO vo) {
		return dao.selectAll(vo);
	}
}
