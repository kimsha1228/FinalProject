package balgil.com.trip.users.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(String message,Model model) {
		log.info("/myPage.do....{}",message);

		return "users/myPage";
	}
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo(String message,Model model) {
		log.info("/myInfo.do....{}",message);

		return "users/myInfo";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(String message,Model model) {
		log.info("/login.do....{}",message);

		if(message!=null) message = "아이디/비번 을 확인하세요";
		model.addAttribute("message", message);
		
		return "users/login";
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout() {
		log.info("/logout.do");
		
		session.invalidate();

		return "redirect:home.do";
	}
	
}


