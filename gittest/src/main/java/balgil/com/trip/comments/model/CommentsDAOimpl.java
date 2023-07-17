package balgil.com.trip.comments.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import balgil.com.trip.reservation.model.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CommentsDAOimpl implements CommentsDAO {

	@Autowired
	SqlSession sqlSession;
	
	public CommentsDAOimpl() {
		log.info("CommentsDAOimpl....");
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

	@Override
	public CommentsVO selectPrevious(CommentsVO vo) {
		return sqlSession.selectOne("COMMENTS_SELECT_PREVIOUS", vo);
	}

	@Override
	public List<CommentsVO> selectWrittenComments(CommentsVO vo) {
		log.info("selectWrittenComments()...{}");
		
		return sqlSession.selectList("COMMENTS_WRITTEN", vo);
	}

	@Override
	public CommentsVO selectMyOneComments(CommentsVO vo) {
		log.info("selectMyOneComments()...{}");
		
		return sqlSession.selectOne("COMMENTS_WRITTEN_ONE", vo);
	}

	 @Override
	    public int getLikesCount(int id) {
	        return sqlSession.selectOne("COMMENTS_GET_LIKES", id);
	    }
	
	 @Override
	    public void updateLikesCount(int id, int likesCount) {
	        sqlSession.update("COMMENTS_UPDATE_LIKES", id);
	    }

}