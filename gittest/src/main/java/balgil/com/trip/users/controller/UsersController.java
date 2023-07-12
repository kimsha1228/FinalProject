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

	@Autowired
	ServletContext sContext;
	
	@Autowired
	HttpSession session;

	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(String message,Model model) {
		log.info("/login.do....{}",message);

		if(message!=null) message = "아이디/비번 을 확인하세요";
		model.addAttribute("message", message);
		
		return "users/login";
	}
	
	@RequestMapping(value = "/loginOK.do", method = RequestMethod.POST)
	public String loginOK(UsersVO vo) {
		log.info("/loginOK.do...{}",vo);
		
		UsersVO vo2 = service.login(vo);
		log.info("vo2...{}",vo2);
		
		if(vo2 == null) {
			return "redirect:login.do?message=fail";
		}else {
			session.setAttribute("user_id", vo2.getId());
			return "redirect:home.do";
		}

	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout() {
		log.info("/logout.do");
		
		session.invalidate();

		return "redirect:home.do";
	}

	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage() {
		log.info("/myPage.do....");
		
		return "users/myPage";
	}
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo() {
		log.info("/myInfo.do....");
		
		return "users/myInfo";
	}
	
	
}


