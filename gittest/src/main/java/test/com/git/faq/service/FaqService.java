package test.com.git.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.git.faq.model.FaqDAO;
import test.com.git.faq.model.FaqVO;

@Slf4j
@Service
public class FaqService {
	
	@Autowired
	FaqDAO dao;
	
	public FaqService() {
		log.info("FaqService...");
	}
	
	public int insert(FaqVO vo) {
		return dao.insert(vo);
	}
	
	public int update(FaqVO vo) {
		return dao.update(vo);
	}
	
	public FaqVO selectOne(FaqVO vo) {
		return dao.selectOne(vo);
	}
	
	public int delete(FaqVO vo) {
		return dao.delete(vo);
	}
	
	public List<FaqVO> selectAll(){
		return dao.selectAll();
	}
	
	public List<FaqVO> searchList(String searchKey, String searchWord){
		return dao.searchList(searchKey, searchWord);
	}
}
