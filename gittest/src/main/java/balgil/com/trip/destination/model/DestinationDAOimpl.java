package balgil.com.trip.destination.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class DestinationDAOimpl implements DestinationDAO {

	@Autowired
	SqlSession sqlSession;

	public DestinationDAOimpl() {
		log.info("DestinationDAOimpl()...");
	}

	@Override
	public List<DestinationVO> selectAll(DestinationVO vo) {
		log.info("selectAll()...{}", vo);

		return sqlSession.selectList("DESTINATION_SELECT_ALL", vo);
	}

	@Override
	public DestinationVO selectOne(DestinationVO vo) {
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("DESTINATION_SELECT_ONE", vo);
	}
}
