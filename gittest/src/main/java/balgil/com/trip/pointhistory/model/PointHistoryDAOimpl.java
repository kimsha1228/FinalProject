package balgil.com.trip.pointhistory.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import balgil.com.trip.coupon.model.CouponVO;
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

	@Override
	public List<PointHistoryVO> selectAllPointHistory() {
		return null;
	}



}