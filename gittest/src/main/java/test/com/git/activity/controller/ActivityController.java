package test.com.git.activity.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.git.activity.model.ActivityVO;
import test.com.git.activity.service.ActivityService;

@Slf4j
@Controller
public class ActivityController {

	@Autowired
	ActivityService service;
	
	@RequestMapping(value = "/insertAct.do", method = RequestMethod.GET)
	public String insertAct() {
		log.info("insertAct.jsp로 이동");
		return "activity/insertAct";
	}

	@RequestMapping(value = "/insertActOk.do", method = RequestMethod.POST)
	public String insertActOK(ActivityVO vo) {
		log.info("insertActOK에서 온 데이터:{}",vo);
		return "activity/insertAct";
	}

	@RequestMapping(value = "/updateAct.do", method = RequestMethod.GET)
	public String updateAct() {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/updateActOk.do", method = RequestMethod.GET)
	public String updateActOK() {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/deleteActOk.do", method = RequestMethod.GET)
	public String deleteActOK() {
		return "test/Activity_test";
	}
	
	@RequestMapping(value = "/selectAllAct.do", method = RequestMethod.GET)
	public String selectAllAct(Locale locale, Model model) {
		return "test/Activity_test";
	}
	
	@RequestMapping(value = "/selectOneAct.do", method = RequestMethod.GET)
	public String selectOneAct(Locale locale, Model model) {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/selectAllUserAct.do", method = RequestMethod.GET)
	public String selectAllUserAct(Locale locale, Model model) {
		return "test/Activity_test";
	}
	
	@RequestMapping(value = "/selectOneUserAct.do", method = RequestMethod.GET)
	public String selectOneUserAct(Locale locale, Model model) {
		//vcountUpAct도 필요
		return "test/Activity_test";
	}
	
	@RequestMapping(value = "/searchAct.do", method = RequestMethod.GET)
	public String searchAct(Locale locale, Model model) {
		return "test/Activity_test";
	}
	
	@RequestMapping(value = "/searchActHome.do", method = RequestMethod.GET)
	public String searchActHome(Locale locale, Model model) {
		return "test/Activity_test";
	}
	
}
