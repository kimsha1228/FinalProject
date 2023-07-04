package balgil.com.trip.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.users.model.UsersVO;
import balgil.com.trip.users.service.UsersService;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class UsersController {
	
	@Autowired
	UsersService service;
	
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String u_insert() {
		log.info("/myPage.do");
		
		return "users/myPage";
		
	}//end u_insert
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String u_selectAll() {
		log.info("/myInfo.do");
		
		return "users/myInfo";
		
	}//end u_selectAll
	
	
	@ResponseBody
	@RequestMapping(value = "/jsonUsersSelectOne.do", method = RequestMethod.GET)
	public UsersVO jsonUsersSelectOne(UsersVO vo) {
		log.info("jsonUserSelectOne.do...{}", vo);
		
		UsersVO vo2 = service.selectOne(vo);
		log.info("vo2: {}", vo2);
		
		return vo2;
	}//end jsonUserSelectOne - sha
	
}
