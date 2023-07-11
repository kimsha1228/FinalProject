package balgil.com.trip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import balgil.com.trip.reservation.model.ReservationDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class schedulerService {
	
	@Autowired
	ReservationDAO dao;
	
	@Scheduled(cron="0 0 0 * * *")
	public void scheduleRun(){
		log.info("00시 정각에 실행");
		dao.updateTime();
		
		
	}
	
	
}
