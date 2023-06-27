package test.com.git.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReservationService {

	@Autowired
	ReservationDAO dao;

	public ReservationService() {
		log.info("MovieService()...");
	}

	public List<ReservationVO> selectAll() {
		return dao.selectAll();
	}

	public ReservationVO selectOne(ReservationVO vo) {
		return dao.selectOne(vo);
	}

	public int insert(ReservationVO vo) {
		return dao.insert(vo);
	}

	public int update(ReservationVO vo) {
		return dao.update(vo);
	}

	public int delete(ReservationVO vo) {
		return dao.delete(vo);
	}


	public List<ReservationVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey,searchWord);
	}
}
