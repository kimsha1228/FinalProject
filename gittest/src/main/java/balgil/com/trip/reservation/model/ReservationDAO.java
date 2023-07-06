package balgil.com.trip.reservation.model;

import java.util.List;

public interface ReservationDAO {

	int insert(ReservationVO vo);

	int update(ReservationVO vo);

	List<ReservationVO> selectAll(ReservationVO vo);

	List<ReservationVO> selectCancel(ReservationVO vo);

}
