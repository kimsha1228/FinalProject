package balgil.com.trip.users.model;

import java.util.List;

public interface UsersDAO {

	List<UsersVO> selectAll();

	UsersVO selectOne(UsersVO vo);
  
	int pointUpdate(String user_id, String point);
	
	int insert(UsersVO vo);

	int update(UsersVO vo);

	int delete(UsersVO vo);

	UsersVO login(UsersVO vo);

	List<UsersVO> searchList(String searchKey, String searchWord);

	UsersVO idCheck(UsersVO vo);
	
}
