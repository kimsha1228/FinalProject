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
	
	
	@RequestMapping(value = "/selectAllComments.do", method = RequestMethod.GET)
	public String selectAllComments(Model model){
		log.info("/selectAllComments.do");
		
		List<CommentsVO> vos = service.selectAll();
		
		model.addAttribute("vos", vos);
		
		return "comments/selectAllComments";
	}
	
	
	@RequestMapping(value = "/selectOneComments.do", method = RequestMethod.GET)
	public String selectOneComments(CommentsVO vo, Model model) {
		log.info("/selectOneComments.do...{}", vo);
		
		CommentsVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		return "comments/selectOneComments";		
	}
	
	@RequestMapping(value = "/insertComments.do", method = RequestMethod.GET)
	public String insertComments(CommentsVO vo) {
		log.info("/insertComments.do....");
		
		return "comments/insertComments";
	}
	
	@RequestMapping(value = "/insertCommentsOK.do", method = RequestMethod.POST)
	public String insertCommentsOK(CommentsVO vo) {
		log.info("/insertCommentsOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllComments.do";
		}else {
			return "redirect:insertComments.do";
		}
	}
	
	@RequestMapping(value = "/updateComments.do", method = RequestMethod.GET)
	public String updateComments(CommentsVO vo, Model model) {
		log.info("/updateComments.do...{}", vo);
		
		CommentsVO vo2 = service.selectOne(vo);
		
		model.addAttribute("vo2", vo2);
		
		return "comments/updateComments";
	}
	
	@RequestMapping(value = "/updateCommentsOK.do", method = RequestMethod.POST)
	public String updateCommentsOK(CommentsVO vo) {
		log.info("/updateCommentsOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectOneComments.do?act_num="+vo.getAct_num();
		}else {
			return "redirect:updateComments.do?act_num="+vo.getAct_num();
		}
	}
	
	@RequestMapping(value = "/deleteCommentsOK.do", method = RequestMethod.GET)
	public String deleteCommentsOK(CommentsVO vo) {
		log.info("/deleteCommentsOK.do...{}", vo);
		
		int result = service.delete(vo);
		
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllComments.do";
		}else {
			return "redirect:selectOneComments.do?act_num="+vo.getAct_num();
		}
	}
}















