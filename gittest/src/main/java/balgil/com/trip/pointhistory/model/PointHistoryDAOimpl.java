package balgil.com.trip.pointhistory.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PointHistoryDAOimpl implements PointHistoryDAO {

	@Autowired
	SqlSession sqlSession;

	public PointHistoryDAOimpl() {
		log.info("PointHistoryDAOimpl()...");
	}

	@Override
	public List<PointHistoryVO> selectAllPointHistory() {
		return null;
	}

}
