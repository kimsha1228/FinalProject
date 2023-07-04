package balgil.com.trip.pointhistory.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.pointhistory.model.PointHistoryDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PointHistoryService {

	@Autowired
	PointHistoryDAO dao;

	public PointHistoryService() {
		log.info("CouponService()...");
	}

//	public List<CouponVO> selectList(CouponVO vo) {
//		return dao.selectList(vo);
//	}

	public int useInsert(String user_id, String point) {
		return dao.useInsert(user_id, point);
	}

}
