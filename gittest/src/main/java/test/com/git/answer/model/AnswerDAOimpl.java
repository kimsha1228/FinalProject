package test.com.git.answer.model;

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
		log.info("insert()....{}", vo);
		return sqlSession.insert("A_INSERT", vo);
	}

	@Override
	public int update(AnswerVO vo) {
		log.info("update()....{}", vo);
		return sqlSession.update("A_UPDATE", vo);
	}

	@Override
	public int delete(AnswerVO vo) {
		log.info("delete()....{}", vo);
		return sqlSession.delete("A_DELETE", vo);
	}

	@Override
	public List<AnswerVO> selectAll() {
		log.info("selectAll()......");
		return sqlSession.selectList("A_SELECT_ALL");
	}
	
	@Override
	public AnswerVO selectOne(AnswerVO vo) {
		log.info("selectOne()....{}", vo);
		
		return sqlSession.selectOne("A_SELECT_ONE",vo);
	}

}
