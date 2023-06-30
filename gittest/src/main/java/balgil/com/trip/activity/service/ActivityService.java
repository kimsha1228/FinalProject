package balgil.com.trip.activity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.activity.model.ActivityDAO;
import balgil.com.trip.activity.model.ActivityVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ActivityService {

	@Autowired
	ActivityDAO dao;

	public ActivityService() {
		log.info("ActivityService()...");
	}

	public ActivityVO selectOne(ActivityVO vo) {
		return dao.selectOne(vo);
	}

}
