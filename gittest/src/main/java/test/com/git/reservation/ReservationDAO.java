package test.com.git.reservation;

import java.util.List;

public interface ReservationDAO {

	List<ReservationVO> selectAll();

	ReservationVO selectOne(ReservationVO vo);

	int insert(ReservationVO vo);

	int update(ReservationVO vo);

	int delete(ReservationVO vo);

	List<ReservationVO> searchList(String searchKey, String searchWord);
}
