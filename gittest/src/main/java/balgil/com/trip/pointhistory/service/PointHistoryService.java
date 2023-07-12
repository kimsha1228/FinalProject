package balgil.com.trip.pointhistory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.pointhistory.model.PointHistoryDAO;
import balgil.com.trip.pointhistory.model.PointHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PointHistoryService {

	@Autowired
	PointHistoryDAO dao;

	public PointHistoryService() {
		log.info("CouponService()...");
	}

	public List<PointHistoryVO> selectAllPointHistory() {
		return dao.selectAllPointHistory();
	}




}
