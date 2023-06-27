package test.com.git.activity.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ActivityDAOimpl implements ActivityDAO {

	@Autowired
	SqlSession sqlSession;
	
	public ActivityDAOimpl() {
		log.info("ActivityDAOimpl 생성자 생성..");
	}
	
	@Override
	public int insert(ActivityVO vo) {
		return 0;
	}

	@Override
	public int update(ActivityVO vo) {
		return 0;
	}

	@Override
	public void updateVcount(ActivityVO vo) {

	}

	@Override
	public int delete(ActivityVO vo) {
		return 0;
	}

	@Override
	public List<ActivityVO> selectAll(ActivityVO vo) {
		return null;
	}

	@Override
	public List<ActivityVO> selectAllUser(ActivityVO vo) {
		return null;
	}

	@Override
	public ActivityVO selectOne(ActivityVO vo) {
		return null;
	}

	@Override
	public List<ActivityVO> searchList(String searchKey, String searchWord) {
		return null;
	}

}
