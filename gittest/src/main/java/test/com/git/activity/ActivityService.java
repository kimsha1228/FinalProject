package test.com.git.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
