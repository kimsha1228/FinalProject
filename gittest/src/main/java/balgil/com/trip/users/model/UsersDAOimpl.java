package balgil.com.trip.users.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UsersDAOimpl implements UsersDAO {

	@Autowired
	SqlSession sqlSession;

	public UsersDAOimpl() {
		log.info("UsersDAOimpl()...");
	}

	@Override
	public UsersVO selectOne(UsersVO vo) {
		log.info("selectOne()...{}", vo);
		
		UsersVO vo2 = sqlSession.selectOne("USERS_SELECTONE", vo);
		
		return vo2;
	}

	@Override
	public int update(String user_id, String point) {
		log.info("update()...{},{}", user_id, point);
		
		UsersVO vo = new UsersVO();
		vo.setUser_id(user_id);
		vo.setPoint(Integer.parseInt(point));
		
		return sqlSession.update("USERPOINT_UPDATE", vo);
		
		
	}


}
