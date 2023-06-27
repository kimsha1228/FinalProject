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
	
	@RequestMapping(value = "/a_selectAll.do", method = RequestMethod.GET)
	public String a_selectAll() {
		log.info("/a_selectAll.do");
		
		List<AnswerVO> vos = service.selectALL();
		
		return "answer/selectAll";
	}
	
	@RequestMapping(value = "/a_selectOne.do", method = RequestMethod.GET)
	public String a_selectOne(AnswerVO vo) {
		log.info("/a_selectOne.do....{}", vo);
		
		AnswerVO vo2 = service.selectOne(vo);
		
		return "answer/selectOne";
	}
	
	@RequestMapping(value = "/a_insert.do", method = RequestMethod.GET)
		public String a_insert() {
		log.info("/a_insert.do...");	
		
		return "answer/insert";
	}
	
	@RequestMapping(value = "/a_insertOK.do", method = RequestMethod.POST)
	public String a_insertOK(AnswerVO vo) {
		log.info("/a_insertOK.do....");
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:a_selectAll.do";
		}else {
			return "redirect:a_insert.do";
		}
	}
	
	@RequestMapping(value = "/a_update.do", method = RequestMethod.GET)
	public String a_update(AnswerVO vo) {
	log.info("/a_update.do...", vo);
	
	AnswerVO vo2 = service.selectOne(vo);
	
	return "answer/update";
	}
	
	@RequestMapping(value = "/updateOK.do", method = RequestMethod.POST)
	public String a_updateOK(AnswerVO vo) {
		log.info("/a_updateOK.do....");
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectOne.do?num="+vo.getNum();
		}else {
			return "redirect:update.do?num="+vo.getNum();
		}
	}
	
	
	
	
}
	

