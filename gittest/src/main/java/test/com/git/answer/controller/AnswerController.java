package test.com.git.answer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.git.answer.model.AnswerVO;
import test.com.git.answer.service.AnswerService;

@Slf4j
@Controller
public class AnswerController {

	@Autowired
	AnswerService service;
	
	@RequestMapping(value = "/answer_selectAll.do", method = RequestMethod.GET)
	public String answer_selectAll() {
		log.info("/answer_selectAll.do");
		
		List<AnswerVO> vos = service.selectALL();
		
		return "answer/selectAll";
	}
	
	@RequestMapping(value = "/answer_selectOne.do", method = RequestMethod.GET)
	public String answer_selectOne(AnswerVO vo) {
		log.info("/answer_selectOne.do....{}", vo);
		
		AnswerVO vo2 = service.selectOne(vo);
		
		return "answer/selectOne";
	}
	
	@RequestMapping(value = "/answer_insert.do", method = RequestMethod.GET)
		public String answer_insert() {
		log.info("/answer_insert.do...");	
		
		return "answer/insert";
	}
	
	@RequestMapping(value = "/answer_insertOK.do", method = RequestMethod.POST)
	public String answer_insertOK(AnswerVO vo) {
		log.info("/answer_insertOK.do....");
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:answer_selectAll.do";
		}else {
			return "redirect:answer_insert.do";
		}
	}
	
	@RequestMapping(value = "/answer_update.do", method = RequestMethod.GET)
	public String answer_update(AnswerVO vo) {
	log.info("/answer_update.do...", vo);
	
	AnswerVO vo2 = service.selectOne(vo);
	
	return "answer/update";
	}
	
	@RequestMapping(value = "/answer_updateOK.do", method = RequestMethod.POST)
	public String answer_updateOK(AnswerVO vo) {
		log.info("/answer_updateOK.do....");
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:answer_selectOne.do?num="+vo.getNum();
		}else {
			return "redirect:answer_update.do?num="+vo.getNum();
		}
	}
	
	
	
	
}
	

