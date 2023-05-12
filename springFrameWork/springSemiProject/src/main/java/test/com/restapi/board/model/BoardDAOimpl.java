package test.com.restapi.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAOimpl implements BoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOimpl.class);

	@Autowired
	SqlSession sqlSession;
	
	public BoardDAOimpl() {
		logger.info("BoardDAOimpl()생성자...");
		
	}

	@Override
	public int insert(BoardVO vo) {
		logger.info("insert()...{}",vo);
		int flag = sqlSession.insert("B_INSERT",vo);
		
		return flag;
	}

	@Override
	public int update(BoardVO vo) {
		logger.info("update()...{}",vo);
		int flag = sqlSession.update("B_UPDATE",vo);
		return flag;
	}

	@Override
	public int delete(BoardVO vo) {
		logger.info("delete()...{}",vo);
		int flag = sqlSession.delete("B_DELETE",vo);
		return flag;
	}

	@Override
	public BoardVO selectOne(BoardVO vo) {
		logger.info("selectOne()...{}",vo);
		BoardVO vo2 = sqlSession.selectOne("B_SELECT_ONE",vo);
		
		return vo2;
	}

	@Override
	public List<BoardVO> selectAll() {
		logger.info("b_selectAll()...");
		List<BoardVO> vos = sqlSession.selectList("B_SELECT_ALL");

		return vos;
	}

	@Override
	public List<BoardVO> searchList(String searchKey, String searchWord) {
		logger.info("searchList()...");
		logger.info("넘어온 searchKey: {}",searchKey);
		logger.info("넘어온 searchWord: {}",searchWord);

		List<BoardVO> vos = null;
		
		if(searchKey.equals("title")) {
			vos = sqlSession.selectList("B_SEARCH_LIST_TITEL", "%" + searchWord + "%");
		}else {
			vos = sqlSession.selectList("B_SEARCH_LIST_CONTENT", "%" + searchWord + "%");			
		}
		return vos;
	}

	@Override
	public void vcountUp(BoardVO vo) {
		logger.info("vcountUp()...{}",vo);
		sqlSession.update("B_UPDATE_VCOUNT",vo);
	}// end vcountUp

}
