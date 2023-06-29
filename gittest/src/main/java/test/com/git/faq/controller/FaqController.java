package test.com.git.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.git.faq.model.FaqVO;
import test.com.git.faq.service.FaqService;

@Slf4j
@Controller
public class FaqController {

	@Autowired
	FaqService service;
	
	@RequestMapping(value = "/faq_selectAll.do", method = RequestMethod.GET)
	public String faq_selectAll(Model model) {
		log.info("/faq_selectAll.do");
		
		List<FaqVO> vos = service.selectAll();
			
		model.addAttribute("vos", vos);
		
		return "faq/selectAll";
	}
	
	@RequestMapping(value = "/faq_selectOne.do", method = RequestMethod.GET)
	public String faq_selectOne(FaqVO vo, Model model) {
		log.info("/faq_selectOne.do...{}", vo);
		
		FaqVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		return "faq/selectOne";
	}
	
	@RequestMapping(value = "/faq_insert.do", method = RequestMethod.GET)
	public String faq_insert() {
		log.info("/faq_insert.do...");
		
		return "faq/insert";
	}
	
	@RequestMapping(value = "/faq_insertOK.do", method = RequestMethod.POST)
	public String faq_insertOK(FaqVO vo) {
		log.info("/faq_insertOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:faq_selectAll.do";
		}else {
			return "redirect:faq_insert.do";
		}
	}
	
	@RequestMapping(value = "/faq_update.do", method = RequestMethod.GET)
	public String faq_update(FaqVO vo, Model model) {
		log.info("/faq_update.do...{}", vo);
		
		FaqVO vo2 = service.selectOne(vo);
		
		model.addAttribute("vo2", vo2);
		
		return "faq/update";
	}
	
	@RequestMapping(value = "/faq_updateOK.do", method = RequestMethod.POST)
	public String faq_updateOK(FaqVO vo) {
		log.info("/faq_updateOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1){
			return "redirect:faq_selectOne.do?id="+vo.getId();
		}else {
			return "redirect:faq_update.do?id="+vo.getId();
		}
	}
	
	@RequestMapping(value = "/faq_deleteOK.do", method = RequestMethod.GET)
	public String faq_deleteOK(FaqVO vo) {
		log.info("/faq_deleteOK.do...{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:faq_selectAll.do";
		}else {
			return "redirect:faq_selectOne.do?id="+vo.getId();
		}
	}
	
}













