package test.com.git.activity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.git.activity.model.ActivityVO;
import test.com.git.activity.service.ActivityService;

@Slf4j
@Controller
public class ActivityRestController {

	@Autowired
	ActivityService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectAllAct.do", method = RequestMethod.GET)
	public List<ActivityVO> jsonSelectAllAct(String seller_id) {
		log.info("jsonSelectAllAct.do..{}",seller_id);
		return service.selectAll(seller_id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonSearchAct.do", method = RequestMethod.GET)
	public List<ActivityVO> jsonSearchAct(String seller_id, String searchKey, String searchWord) {
		log.info("jsonSearchAct.do..");
		log.info("유저:{}",seller_id);
		log.info("키:{}",searchKey);
		log.info("워드:{}",searchWord);
		return service.searchAct(seller_id,searchKey,searchWord);
	}
	
}
