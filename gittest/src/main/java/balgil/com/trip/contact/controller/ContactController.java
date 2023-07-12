package balgil.com.trip.contact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.activity.model.ActivityVO;
import balgil.com.trip.answer.model.AnswerVO;
import balgil.com.trip.answer.service.AnswerService;
import balgil.com.trip.contact.model.ContactVO;
import balgil.com.trip.contact.service.ContactService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ContactController {
	@Autowired
	ContactService service;
	
	@Autowired
	AnswerService answerservice;
	
	@RequestMapping(value = "/selectAllContact.do", method = RequestMethod.GET)
	public String selectAllContact(Model model) {
		log.info("/selectAllContact.do");
		
		List<ContactVO> vos = service.selectAll();
		model.addAttribute("vos", vos);
		
		return "contact/selectAllContact";
	}
	
	@RequestMapping(value = "/selectOneContact.do", method = RequestMethod.GET)
	public String selectOnecontact(ContactVO vo, Model model) {
		log.info("/selectOneContact.do....{}", vo);
		
		ContactVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		AnswerVO avo = new AnswerVO();
		avo.setContact_id(vo.getId());
		List<AnswerVO> coms = answerservice.selectAll(avo);
		log.info("{}",coms);
		
		model.addAttribute("coms", coms);
		
		return "contact/selectOneContact";
	}
	
	@RequestMapping(value = "/insertContact.do", method = RequestMethod.GET)
		public String insertContact() {
		log.info("/insertContact.do...");	
		
		return "contact/insertContact";
	}
	
	@RequestMapping(value = "/insertContactOK.do", method = RequestMethod.GET)
	public String insertContactOK(ContactVO vo) {
		log.info("/insertContactOK.do....");
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllContact.do";
		}else {
			return "redirect:insertContact.do";
		}
	}
	
	@RequestMapping(value = "/updateContact.do", method = RequestMethod.GET)
	public String updateContact(ContactVO vo, Model model) {
		log.info("/updateContact.do...{}", vo);

		ContactVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "contact/updateContact";
	}
	
	@RequestMapping(value = "/updateContactOK.do", method = RequestMethod.POST)
	public String updateContactOK(ContactVO vo) {
		log.info("/updateContactOK.do...{}", vo);

		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectOneContact.do?id="+vo.getId();
		}else {
			return "redirect:updateContact.do?id="+vo.getId();
		}
	}
	@RequestMapping(value = "/deleteContactOK.do", method = RequestMethod.GET)
	public String deleteContactOK(ContactVO vo) {
		log.info("/deleteContactOK.do....{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllContact.do";
		}else {
			return "redirect:selectOneContact.do?id="+vo.getId();
		}
	}
	
}
