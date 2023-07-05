package balgil.com.trip.answer.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AnswerDAOimpl implements AnswerDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public AnswerDAOimpl() {
		log.info("AnswerDAOimpl....");
	}
	
	@Override
	public int insert(AnswerVO vo) {
		log.info("insertAnswer()....{}", vo);
		return sqlSession.insert("ANSWER_INSERT", vo);
	}

	@Override
	public int update(AnswerVO vo) {
		log.info("updateAnswer()....{}", vo);
		return sqlSession.update("ANSWER_UPDATE", vo);
	}

	@Override
	public int delete(AnswerVO vo) {
		log.info("deleteAnswer()....{}", vo);
		return sqlSession.delete("ANSWER_DELETE", vo);
	}

	@Override
	public List<AnswerVO> selectAll() {
		log.info("selectAll()......");
		return sqlSession.selectList("ANSWER_SELECT_ALL");
	}
	
	@Override
	public AnswerVO selectOne(AnswerVO vo) {
		log.info("selectOne()....{}", vo);
		
		return sqlSession.selectOne("ANSWER_SELECT_ONE",vo);
	}
	
	@Override
	public List<AnswerVO> selectAll(AnswerVO vo) {
	    log.info("selectAllAnswer()......{}", vo);
	    return sqlSession.selectList("ANSWER_SELECT_ALL", vo);
	}

}
