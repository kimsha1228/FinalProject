package balgil.com.trip.pointhistory.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.ConvertOperators.ToDate;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PointHistoryDAOimpl implements PointHistoryDAO {

	@Autowired
	SqlSession sqlSession;

	public PointHistoryDAOimpl() {
		log.info("CouponDAOimpl()...");
	}

	@Override
	public int useInsert(String user_id, String point) {
		log.info("useInsert()...");

		PointHistoryVO vo = new PointHistoryVO();
		vo.setUser_id(user_id);
		vo.setPoint(Integer.parseInt(point));
		
		return sqlSession.insert("POINTHISTORY_USE_INSERT", vo);
	}

	@Override
	public int useInsertBack(String user_id, String point) {
		log.info("useInsertBack()...");

		PointHistoryVO vo = new PointHistoryVO();
		vo.setUser_id(user_id);
		vo.setPoint(Integer.parseInt(point));
		
		return sqlSession.insert("POINTHISTORY_USE_INSERT_BACK", vo);
	}

	@Override
	public int saveInsert(String user_id, String history, String point) {
		log.info("saveInsert()...");

		PointHistoryVO vo = new PointHistoryVO();
		vo.setUser_id(user_id);
		vo.setHistory(history);
		vo.setPoint(Integer.parseInt(point));
		
		return sqlSession.insert("POINTHISTORY_SAVE_INSERT", vo);
	}

//	@Override
//	public List<PointHistoryVO> selectAll(PointHistoryVO vo) {
//		
//		List<PointHistoryVO> vos = sqlSession.selectList("POINTHISTORY_SELECTLIST", vo);
//		
//		return vos;
//	}

}
