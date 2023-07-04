package balgil.com.trip.pointhistory.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
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
		
		PointHistoryVO vo = new PointHistoryVO();
		vo.setUser_id(user_id);
		vo.setPoint(Integer.parseInt(point));
		
		return sqlSession.insert("POINTHISTORY_USE_INSERT", vo);
	}

//	@Override
//	public List<PointHistoryVO> selectList(PointHistoryVO vo) {
//		log.info("selectList()...{}", vo);
//
//		List<PointHistoryVO> vos = sqlSession.selectList("COUPON_SELECTLIST", vo);
//
//		return vos;
//	}

}
