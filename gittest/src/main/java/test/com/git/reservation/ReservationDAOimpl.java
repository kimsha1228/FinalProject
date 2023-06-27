package test.com.git.reservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReservationDAOimpl implements ReservationDAO {

	@Autowired
	SqlSession sqlSession;

	public ReservationDAOimpl() {
		log.info("MovieDAOimpl()...");
	}

	@Override
	public List<ReservationVO> selectAll() {
		log.info("selectAll()...");

		return sqlSession.selectList("MV_SELECT_ALL");
	}

	@Override
	public ReservationVO selectOne(ReservationVO vo) {
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("MV_SELECT_ONE", vo);
	}

	@Override
	public int insert(ReservationVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("MV_INSERT", vo);
	}

	@Override
	public int update(ReservationVO vo) {
		log.info("update()...{}", vo);

		return sqlSession.update("MV_UPDATE", vo);
	}
	
	@Override
	public int delete(ReservationVO vo) {
		log.info("delete()...{}", vo);

		return sqlSession.delete("MV_DELETE", vo);
	}


	@Override
	public List<ReservationVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()...searchKey:{}", searchKey);
		log.info("searchList()...searchWord:{}", searchWord);
		
		String key = "";
		if(searchKey.equals("title")) {
			key = "MV_SEARCH_LIST_TITLE";
		}else {
			key = "MV_SEARCH_LIST_PRODUCER";
		}
		
		return sqlSession.selectList(key,"%"+searchWord+"%");
	}

}
