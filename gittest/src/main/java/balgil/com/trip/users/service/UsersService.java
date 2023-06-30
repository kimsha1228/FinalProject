package balgil.com.trip.users.service;

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

	public UsersVO selectOne(UsersVO vo) {
		return dao.selectOne(vo);
	}

}
