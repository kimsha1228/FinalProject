package test.com.git.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class UsersController {
	
	@Autowired
	UsersService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonUsersSelectOne.do", method = RequestMethod.GET)
	public UsersVO jsonUsersSelectOne(UsersVO vo) {
		log.info("jsonUserSelectOne.do...{}", vo);
		
		UsersVO vo2 = service.selectOne(vo);
		log.info("vo2: {}", vo2);
		
		return vo2;
	}
	
}
