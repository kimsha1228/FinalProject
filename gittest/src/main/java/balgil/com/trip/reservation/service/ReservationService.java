package balgil.com.trip.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.reservation.model.ReservationDAO;
import balgil.com.trip.reservation.model.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReservationService {

	@Autowired
	ReservationDAO dao;

	public ReservationService() {
		log.info("ReservationService()...");
	}

	public int insert(ReservationVO vo) {
		return dao.insert(vo);
	}

	public int update(ReservationVO vo) {
		return dao.update(vo);
	}

}
