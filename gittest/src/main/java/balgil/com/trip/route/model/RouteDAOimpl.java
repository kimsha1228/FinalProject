package balgil.com.trip.route.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class RouteDAOimpl implements RouteDAO {

	@Autowired
	SqlSession sqlSession;

	public RouteDAOimpl() {
		log.info("RouteDAOimpl 생성자 생성...");
	}

	@Override
	public int insert(RouteVO vo) {
		return 0;
	}

	@Override
	public int update(RouteVO vo) {
		return 0;
	}

	@Override
	public int delete(RouteVO vo) {
		return 0;
	}

	@Override
	public List<RouteVO> selectAll(RouteVO vo) {
		return null;
	}

	@Override
	public RouteVO selectOne(RouteVO vo) {
		return null;
	}

	@Override
	public List<RouteVO> searchList(String searchKey, String searchWord) {
		return null;
	}

	@Override
	public void updateVcount(RouteVO vo) {

	}

	@Override
	public void updateLikeUp(RouteVO vo) {

	}

}
