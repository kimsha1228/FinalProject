package balgil.com.trip.movie;

import java.util.List;

public interface MovieDAO {

	List<MovieVO> selectAll();

	MovieVO selectOne(MovieVO vo);

	int insert(MovieVO vo);

	int update(MovieVO vo);

	int delete(MovieVO vo);

	List<MovieVO> searchList(String searchKey, String searchWord);
}
