package test.com.git.contact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/contact_selectAll.do", method = RequestMethod.GET)
	public String contact_selectAll(Model model) {
		log.info("/contact_selectAll.do");
		
		List<ContactVO> vos = service.selectAll();
		model.addAttribute("vos", vos);
		
		return "contact/selectAll";
	}
	
	@RequestMapping(value = "/contact_selectOne.do", method = RequestMethod.GET)
	public String contact_selectOne(ContactVO vo, Model model) {
		log.info("/contact_selectOne.do....{}", vo);
		
		ContactVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		return "contact/selectOne";
	}
	
	@RequestMapping(value = "/contact_insert.do", method = RequestMethod.GET)
		public String contact_insert() {
		log.info("/contact_insert.do...");	
		
		return "contact/insert";
	}
	
	@RequestMapping(value = "/contact_insertOK.do", method = RequestMethod.POST)
	public String contact_insertOK(ContactVO vo) {
		log.info("/contact_insertOK.do....");
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:contact_selectAll.do";
		}else {
			return "redirect:contact_insert.do";
		}
	}
	@RequestMapping(value = "/contact_deleteOK.do", method = RequestMethod.POST)
	public String contact_deleteOK(ContactVO vo) {
		log.info("/contact_deleteOK.do....{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:contact_selectAll.do";
		}else {
			return "redirect:contact_selectOne.do?num="+vo.getNum();
		}
	}
	
}
