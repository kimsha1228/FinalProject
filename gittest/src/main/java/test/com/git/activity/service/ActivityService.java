package test.com.git.activity.service;

import java.util.List;

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

	public List<ActivityVO> selectAll(String seller_id) {
		return dao.selectAll(seller_id);
	}

	public List<ActivityVO> searchAct(String seller_id, String searchKey, String searchWord) {
		return dao.searchList(seller_id,searchKey, searchWord);
	}
	
}
