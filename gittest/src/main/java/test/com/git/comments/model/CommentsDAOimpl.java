package test.com.git.comments.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CommentsDAOimpl implements CommentsDAO {

	@Autowired
	SqlSession sqlSession;
	
	public CommentsDAOimpl() {
		log.info("BoardDAOimpl....");
	}
	
	@Override
	public List<CommentsVO> selectAll() {
		log.info("selectAll()....");
		
		return sqlSession.selectList("COMMENTS_SELECT_ALL");
	}

	@Override
	public CommentsVO selectOne(CommentsVO vo) {
		log.info("selectOne()...{}", vo);
		
		return sqlSession.selectOne("COMMENTS_SELECT_ONE", vo);
	}

	@Override
	public int insert(CommentsVO vo) {
		log.info("insert()...{}", vo);
		
		return sqlSession.insert("COMMENTS_INSERT", vo);
	}

	@Override
	public int update(CommentsVO vo) {
		log.info("update()...{}", vo);
		
		return sqlSession.update("COMMENTS_UPDATE", vo);
	}

	@Override
	public int delete(CommentsVO vo) {
		log.info("delete()...{}");
		
		return sqlSession.delete("COMMENTS_DELETE", vo);
	}


}
