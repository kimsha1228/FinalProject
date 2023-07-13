package balgil.com.trip.pointhistory.model;

import java.util.List;

import balgil.com.trip.users.model.UsersVO;

public interface PointHistoryDAO {

	int useInsert(String user_id, String point);

	int useInsertBack(String user_id, String point);

//	List<PointHistoryVO> selectAll(PointHistoryVO vo);

}
