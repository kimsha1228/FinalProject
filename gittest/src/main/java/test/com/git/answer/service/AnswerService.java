package test.com.git.answer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.git.answer.model.AnswerDAO;
import test.com.git.answer.model.AnswerVO;

@Slf4j
@Service
public class AnswerService {
	@Autowired
	AnswerDAO dao;
	
	public AnswerService() {
		log.info("AnswerService....");
	}
	
	public int insert(AnswerVO vo) {
		return dao.insert(vo);
	}
	
	public int update(AnswerVO vo) {
		return dao.update(vo);
	}
	
	public int delete(AnswerVO vo) {
		return dao.delete(vo);
	}
	
	public List<AnswerVO> selectALL(){
		return dao.selectAll();
	}
	
	public AnswerVO selectOne(AnswerVO vo) {
		return dao.selectOne(vo);
	}

}
