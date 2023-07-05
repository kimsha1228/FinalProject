package balgil.com.trip.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.users.model.UsersDAO;
import balgil.com.trip.users.model.UsersVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UsersService {

	@Autowired
	UsersDAO dao;

	public UsersService() {
		log.info("UsersService()...");
	}

	public List<UsersVO> selectAll() {
		return dao.selectAll();
	}

	public UsersVO selectOne(UsersVO vo) {
		return dao.selectOne(vo);
	}

	public int insert(UsersVO vo) {
		return dao.insert(vo);
	}

	public int update(UsersVO vo) {
		return dao.update(vo);
	}

	public int delete(UsersVO vo) {
		return dao.delete(vo);
	}

	public UsersVO login(UsersVO vo) {
		return dao.login(vo);
	}

	public List<UsersVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey,searchWord);
	}

	public UsersVO idCheck(UsersVO vo) {
		return dao.idCheck(vo);
	}

  public int pointUpdate(String user_id, String point) {
		return dao.pointUpdate(user_id, point);
	}

}
