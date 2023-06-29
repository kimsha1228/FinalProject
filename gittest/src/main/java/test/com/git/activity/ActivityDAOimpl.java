package test.com.git.activity;

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
		log.info("ActivityDAOimpl()...");
	}

	@Override
	public ActivityVO selectOne(ActivityVO vo) {
		log.info("selectOne()...{}", vo);
		
		ActivityVO vo2 = sqlSession.selectOne("ACTIVITY_SELECTONE", vo);
		
		return vo2;
	}


}
