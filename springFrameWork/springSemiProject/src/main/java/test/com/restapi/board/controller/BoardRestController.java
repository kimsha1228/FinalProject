package test.com.restapi.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.restapi.board.model.BoardVO;
import test.com.restapi.board.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class BoardRestController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/json_b_selectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<BoardVO> json_b_selectAll() {
		log.info("/json_b_selectAll.do...");
		
		List<BoardVO> vos = service.selectAll();
		for (BoardVO x : vos) {
			log.info(x.toString());
		}
		
		return vos;
	}
	
	@RequestMapping(value = "/json_b_searchList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<BoardVO> json_b_searchList(String searchKey,String searchWord) {
		log.info("/json_b_searchList.do...");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);
		
		List<BoardVO> vos = service.searchList(searchKey,searchWord);
		log.info("vos.size():{}",vos.size());
		return vos;
	}
	
	@RequestMapping(value = "/json_b_selectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public BoardVO json_b_selectOne(BoardVO vo) {
		log.info("/json_b_selectOne.do...{}",vo);
		
		BoardVO vo2 = service.selectOne(vo);
		log.info("vo:{}",vo2);
		return vo2;
	}
}
