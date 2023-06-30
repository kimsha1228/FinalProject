package balgil.com.trip.comments.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.comments.model.CommentsVO;
import balgil.com.trip.comments.service.CommentsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentsController {
	@Autowired
	CommentsService service;
	
	
	@RequestMapping(value = "/comments_selectAll.do", method = RequestMethod.GET)
	public String comments_selectAll(Model model){
		log.info("/comments_selectAll.do");
		
		List<CommentsVO> vos = service.selectAll();
		
		model.addAttribute("vos", vos);
		
		return "comments/selectAll";
	}
	
	
	@RequestMapping(value = "/comments_selectOne.do", method = RequestMethod.GET)
	public String comments_selectOne(CommentsVO vo, Model model) {
		log.info("/comments_selectOne.do...{}", vo);
		
		CommentsVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		return "comments/selectOne";		
	}
	
	@RequestMapping(value = "/comments_insert.do", method = RequestMethod.GET)
	public String comments_insert(CommentsVO vo) {
		log.info("/comments_insert.do....");
		
		return "comments/insert";
	}
	
	@RequestMapping(value = "/comments_insertOK.do", method = RequestMethod.POST)
	public String comments_insertOK(CommentsVO vo) {
		log.info("/comments_insertOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:comments_selectAll.do";
		}else {
			return "redirect:comments_insert.do";
		}
	}
	
	@RequestMapping(value = "/comments_update.do", method = RequestMethod.GET)
	public String comments_update(CommentsVO vo, Model model) {
		log.info("/comments_update.do...{}", vo);
		
		CommentsVO vo2 = service.selectOne(vo);
		
		model.addAttribute("vo2", vo2);
		
		return "comments/update";
	}
	
	@RequestMapping(value = "/comments_updateOK.do", method = RequestMethod.POST)
	public String comments_updateOK(CommentsVO vo) {
		log.info("/comments_updateOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:comments_selectOne.do?act_num="+vo.getAct_num();
		}else {
			return "redirect:comments_update.do?act_num="+vo.getAct_num();
		}
	}
	
	@RequestMapping(value = "/comments_deleteOK.do", method = RequestMethod.GET)
	public String comments_deleteOK(CommentsVO vo) {
		log.info("/comments_deleteOK.do...{}", vo);
		
		int result = service.delete(vo);
		
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:comments_selectAll.do";
		}else {
			return "redirect:comments_selectOne.do?act_num="+vo.getAct_num();
		}
	}
}















