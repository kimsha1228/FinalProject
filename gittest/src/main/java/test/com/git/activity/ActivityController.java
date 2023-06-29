package test.com.git.activity;

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
public class ActivityController {
	
	@Autowired
	ActivityService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonActSelectOne.do", method = RequestMethod.GET)
	public ActivityVO jsonActSelectOne(ActivityVO vo) {
		log.info("ActSelectOne.do...{}", vo);
		
		ActivityVO vo2 = service.selectOne(vo);
		log.info("vo2: {}", vo2);
		
		return vo2;
	}
	
}
