package balgil.com.trip.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.faq.model.FaqVO;
import balgil.com.trip.faq.service.FaqService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FaqController {

	@Autowired
	FaqService service;
	
	@RequestMapping(value = "/selectAllFAQ.do", method = RequestMethod.GET)
	public String selectAllFAQ(Model model) {
		log.info("/selectAllFAQ.do");
		
		List<FaqVO> vos = service.selectAll();
			
		model.addAttribute("vos", vos);
		
		return "faq/selectAll";
	}
	
	@RequestMapping(value = "/selectOneFAQ.do", method = RequestMethod.GET)
	public String selectOneFAQ(FaqVO vo, Model model) {
		log.info("/selectOneFAQ.do...{}", vo);
		
		FaqVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		return "faq/selectOne";
	}
	
	@RequestMapping(value = "/insertFAQ.do", method = RequestMethod.GET)
	public String insertFAQ() {
		log.info("/insertFAQ.do...");
		
		return "faq/insert";
	}
	
	@RequestMapping(value = "/insertFAQOK.do", method = RequestMethod.POST)
	public String insertFAQOK(FaqVO vo) {
		log.info("/insertFAQOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllFAQ.do";
		}else {
			return "redirect:insertFAQ.do";
		}
	}
	
	@RequestMapping(value = "/updateFAQ.do", method = RequestMethod.GET)
	public String updateFAQ(FaqVO vo, Model model) {
		log.info("/updateFAQ.do...{}", vo);
		
		FaqVO vo2 = service.selectOne(vo);
		
		model.addAttribute("vo2", vo2);
		
		return "faq/update";
	}
	
	@RequestMapping(value = "/updateFAQOK.do", method = RequestMethod.POST)
	public String updateFAQOK(FaqVO vo) {
		log.info("/updateFAQOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1){
			return "redirect:selectOneFAQ.do?id="+vo.getId();
		}else {
			return "redirect:updateFAQ.do?id="+vo.getId();
		}
	}
	
	@RequestMapping(value = "/deleteFAQOK.do", method = RequestMethod.GET)
	public String deleteFAQOK(FaqVO vo) {
		log.info("/deleteFAQOK.do...{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllFAQ.do";
		}else {
			return "redirect:selectOneFAQ.do?id="+vo.getId();
		}
	}
	
}













