package balgil.com.trip.users.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@Autowired
	ServletContext sContext;
	
	@Autowired
	HttpSession session;

	@RequestMapping(value = "/u_selectAll.do", method = RequestMethod.GET)
	public String u_selectAll(Model model) {
		log.info("/u_selectAll.do");

		List<UsersVO> vos = service.selectAll();

		model.addAttribute("vos", vos);

		return "users/selectAll";
	}

	@RequestMapping(value = "/u_searchList.do", method = RequestMethod.GET)
	public String u_searchList(String searchKey,String searchWord,Model model) {
		log.info("/u_searchList.do...searchKey:{}",searchKey);
		log.info("/u_searchList.do...searchWord:{}",searchWord);

		List<UsersVO> vos = service.searchList(searchKey,searchWord);

		model.addAttribute("vos", vos);
		
		return "users/selectAll";
	}

	@RequestMapping(value = "/u_insert.do", method = RequestMethod.GET)
	public String m_insert() {
		log.info("/u_insert.do");

		return "users/insert";
	}

	@RequestMapping(value = "/u_insertOK.do", method = RequestMethod.POST)
	public String u_insertOK(UsersVO vo) throws IllegalStateException, IOException {
		log.info("/u_insertOK.do...{}", vo);

		
		log.info("{}", vo);

		int result = service.insert(vo);

		if (result == 1) {
			return "redirect:u_selectAll.do";
		} else {
			return "redirect:u_insert.do";
		}
	}

	@RequestMapping(value = "/u_updateOK.do", method = RequestMethod.POST)
	public String u_updateOK(UsersVO vo) throws IllegalStateException, IOException {
		log.info("/u_updateOK.do...{}", vo);

		
		log.info("{}", vo);

		int result = service.update(vo);

		if (result == 1) {
			return "redirect:u_selectOne.do?num=" + vo.getId();
		} else {
			return "redirect:u_update.do?num=" + vo.getId();
		}
	}

	@RequestMapping(value = "/loginOK.do", method = RequestMethod.POST)
	public String loginOK(UsersVO vo) {
		log.info("/loginOK.do...{}",vo);
		
		UsersVO vo2 = service.login(vo);
		log.info("vo2...{}",vo2);

  }//end u_selectAll
	
	@RequestMapping(value = "/u_deleteOK.do", method = RequestMethod.GET)
	public String m_deleteOK(UsersVO vo) {
		log.info("/u_deleteOK.do");

		int result = service.delete(vo);

		if (result == 1) {
			return "redirect:u_selectAll.do";
		} else {
			return "redirect:u_selectOne.do?num=" + vo.getId();
		}

	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout() {
		log.info("/logout.do");
		
		session.invalidate();

		return "redirect:home.do";
	}

	@RequestMapping(value = "/u_selectOne.do", method = RequestMethod.GET)
	public String u_selectOne(UsersVO vo, Model model) {
		log.info("/u_selectOne.do...{}", vo);

		UsersVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "users/selectOne";
	}

	@RequestMapping(value = "/u_update.do", method = RequestMethod.GET)
	public String u_update(UsersVO vo, Model model) {
		log.info("/u_update.do...{}", vo);

		UsersVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "users/update";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(String message,Model model) {
		log.info("/login.do....{}",message);

		if(message!=null) message = "아이디/비번 을 확인하세요";
		model.addAttribute("message", message);
		
		return "users/login";
	}

}

  @ResponseBody
	@RequestMapping(value = "/jsonUsersSelectOne.do", method = RequestMethod.GET)
	public UsersVO jsonUsersSelectOne(UsersVO vo) {
		log.info("jsonUserSelectOne.do...{}", vo);
		
		if(vo2 == null) {
			return "redirect:login.do?message=fail";
		}else {
			session.setAttribute("user_id", vo2.getId());
			return "redirect:home.do";
		}

	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/jsonUsersSelectOne.do", method = RequestMethod.GET)
	 * public UsersVO jsonUsersSelectOne(UsersVO vo) {
	 * log.info("jsonUserSelectOne.do...연습하는 중  ㅇㅇㅇㅇㅇㅇㅇ....{}", vo);
	 * 
	 * UsersVO vo2 = service.selectOne(vo); log.info("vo2: {}", vo2);
	 * 
	 * return vo2; }//end jsonUserSelectOne - sha
	 */	

