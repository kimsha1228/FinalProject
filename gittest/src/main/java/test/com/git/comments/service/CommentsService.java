package test.com.git.comments.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.git.comments.model.CommentsDAO;
import test.com.git.comments.model.CommentsVO;

@Slf4j
@Service
public class CommentsService {
	
	@Autowired
	CommentsDAO dao;
	
	public CommentsService() {
		log.info("CommentsService...");
	}
	
	public List<CommentsVO> selectAll(){
		return dao.selectAll();
	}
	
	public CommentsVO selectOne(CommentsVO vo) {
		return dao.selectOne(vo);
	}
	
	public int insert(CommentsVO vo) {
		return dao.insert(vo);
	}
	
	public int update(CommentsVO vo) {
		return dao.update(vo);
	}
	
	public int delete(CommentsVO vo) {
		return dao.delete(vo);
	}
}
