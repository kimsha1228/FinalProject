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
	
	public int deleteCom(ImageVO vo) {
		return dao.deleteCom(vo);
	}
	
	public int deleteAct(ImageVO vo) {
		return dao.deleteAct(vo);
	}

	public List<ImageVO> selectAllCom(ImageVO vo) {
		return dao.selectAllCom(vo);
	}
	
	public List<ImageVO> selectAllAct(ImageVO vo) {
		return dao.selectAllAct(vo);
	}
	
}
