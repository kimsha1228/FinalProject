package test.com.restapi.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.restapi.member.model.MemberVO;
import test.com.restapi.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/m_selectAll.do", method = RequestMethod.GET)
	public String m_selectAll() {
		log.info("/m_selectAll.do...");
		
		return "member/selectAll";
	}
	
	@RequestMapping(value = "/m_selectOne.do", method = RequestMethod.GET)
	public String m_selectOne(MemberVO vo) {
		log.info("/m_selectOne.do...{}",vo);
		
		return "member/selectOne";
	}
	
	@RequestMapping(value = "/m_insert.do", method = RequestMethod.GET)
	public String m_insert() {
		log.info("/m_insert.do...");
		
		return "member/insert";
	}
	@RequestMapping(value = "/m_insertOK.do", method = RequestMethod.POST)
	public String m_insertOK(MemberVO vo) {
		log.info("/m_insertOK.do...{}",vo);
		
		int result = service.insert(vo);
		log.info("삽입결과:{}",result);
		
		if(result==1) {
			return "redirect:m_selectAll.do";
		}else {
			return "redirect:m_insert.do";
		}
	}
	@RequestMapping(value = "/m_update.do", method = RequestMethod.GET)
	public String m_update(MemberVO vo) {
		log.info("/m_update.do...{}",vo);
		
		return "member/update";
	}
	
	@RequestMapping(value = "/m_updateOK.do", method = RequestMethod.POST)
	public String m_updateOK(MemberVO vo) {
		log.info("/m_updateOK.do...{}",vo);
		
		int result = service.update(vo);
		log.info("수정결과:{}",result);
		
		if(result==1) {
			return "redirect:m_selectOne.do?num="+vo.getNum();
		}else {
			return "redirect:m_update.do?num="+vo.getNum();
		}
	}
	@RequestMapping(value = "/m_deleteOK.do", method = RequestMethod.GET)
	public String m_deleteOK(MemberVO vo) {
		log.info("/m_deleteOK.do...{}",vo);
		
		int result = service.delete(vo);
		log.info("삭제결과:{}",result);
		
		if(result==1) {
			return "redirect:m_selectAll.do";
		}else {
			return "redirect:m_update.do?num="+vo.getNum();
		}
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		log.info("/login.do");

		return "member/login"; // servlet request.dispatcher랑 비슷한 역할을 해준다
	}// end login

	@RequestMapping(value = "/loginOK.do", method = RequestMethod.POST)
	public String loginOK(MemberVO vo) {
		log.info("/loginOK.do...{}", vo);

		MemberVO vo2 = service.login(vo);
		log.info("/loginOK??: {}", vo2);

		if (vo2 == null) {
			return "redirect:login.do";
		} else {
			return "redirect:index.do";
		}

	}// end loginOK

	

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Model model) {
		log.info("/logout.do");

		// response.sendredirect랑 같은 효과
		return "redirect:index.do"; // servlet response.sendredirect랑 같은 효과
	}// end logout
}
