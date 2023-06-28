package test.com.git.activity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.git.activity.model.ActivityDAO;
import test.com.git.activity.model.ActivityVO;

@Service
public class ActivityService {
 
	@Autowired
	ActivityDAO dao;

	public int insert(ActivityVO vo) {
		return dao.insert(vo);
	}
	
}
