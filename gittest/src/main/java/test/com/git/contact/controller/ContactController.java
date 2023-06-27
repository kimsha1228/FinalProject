package test.com.git.contact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.git.contact.model.ContactVO;
import test.com.git.contact.service.ContactService;

@Slf4j
@Controller
public class ContactController {
	@Autowired
	ContactService service;
	
	@RequestMapping(value = "/c_selectAll.do", method = RequestMethod.GET)
	public String c_selectAll() {
		log.info("/c_selectAll.do");
		
		List<ContactVO> vos = service.selectAll();
		
		return "contact/selectAll";
	}
	
	@RequestMapping(value = "/c_selectOne.do", method = RequestMethod.GET)
	public String c_selectOne(ContactVO vo) {
		log.info("/c_selectOne.do....{}", vo);
		
		ContactVO vo2 = service.selectOne(vo);
		
		return "contact/selectOne";
	}
	
	@RequestMapping(value = "/c_insert.do", method = RequestMethod.GET)
		public String c_insert() {
		log.info("/c_insert.do...");	
		
		return "contact/insert";
	}
	
	@RequestMapping(value = "/c_insertOK.do", method = RequestMethod.POST)
	public String c_insertOK(ContactVO vo) {
		log.info("/c_insertOK.do....");
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:c_selectAll.do";
		}else {
			return "redirect:c_insert.do";
		}
	}
	@RequestMapping(value = "/deleteOK.do", method = RequestMethod.POST)
	public String c_deleteOK(ContactVO vo) {
		log.info("/c_deleteOK.do....{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:c_selectAll.do";
		}else {
			return "redirect:c_selectOne.do?num="+vo.getNum();
		}
	}
	
}
