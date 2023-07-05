package balgil.com.trip.users.model;

public interface UsersDAO {

	UsersVO selectOne(UsersVO vo);

	int update(String user_id, String point);

}
