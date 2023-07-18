package balgil.com.trip.comments.model;

import java.util.List;

import balgil.com.trip.reservation.model.ReservationVO;

public interface CommentsDAO {

    List<CommentsVO> selectAll();

    CommentsVO selectOne(CommentsVO vo);

    int insert(CommentsVO vo);

    int update(CommentsVO vo);

    int delete(CommentsVO vo);
    
	CommentsVO selectPrevious(CommentsVO vo);

	List<CommentsVO> selectWrittenComments(CommentsVO vo);

	CommentsVO selectMyOneComments(CommentsVO vo);


}