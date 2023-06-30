package balgil.com.trip.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MovieService {

	@Autowired
	MovieDAO dao;

	public MovieService() {
		log.info("MovieService()...");
	}

	public List<MovieVO> selectAll() {
		return dao.selectAll();
	}

	public MovieVO selectOne(MovieVO vo) {
		return dao.selectOne(vo);
	}

	public int insert(MovieVO vo) {
		return dao.insert(vo);
	}

	public int update(MovieVO vo) {
		return dao.update(vo);
	}

	public int delete(MovieVO vo) {
		return dao.delete(vo);
	}


	public List<MovieVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey,searchWord);
	}
}
