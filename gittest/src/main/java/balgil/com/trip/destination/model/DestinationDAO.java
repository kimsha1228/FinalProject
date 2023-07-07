package balgil.com.trip.destination.model;

import java.util.List;

public interface DestinationDAO {

	List<DestinationVO> selectAll(DestinationVO vo);

	DestinationVO selectOne(DestinationVO vo);
}
