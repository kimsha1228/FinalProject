package test.com.restapi.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.restapi.board.model.BoardVO;
import test.com.restapi.board.service.BoardService;

/**
 * Handles requests for the application home page.
 * 어노테이션을 통해 제어한다
 * servlet으로 했을땐 위에 링크적고 아래에 if로 분기했지만 spring은 다르다
 */
@Controller
@Slf4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	/**
	 *  메서드의 이름이랑 RequestMapping value = ""는 통일 시켜주는게 찾기 편하다!
	 */
	@RequestMapping(value = "/b_insert.do", method = RequestMethod.GET)
	public String b_insert(Model model) {
		log.info("/b_insert.do");

		return "board/insert"; //servlet request.dispatcher랑 비슷한 역할을 해준다
	}//end b_insert
	
	@RequestMapping(value = "/b_insertOK.do", method = RequestMethod.POST)
	public String b_insertOK(BoardVO vo, Model model) {
		log.info("/b_insertOK.do: {}",vo);

		int result = service.insert(vo);
		
		log.info("삽입결과:{}",result==1?"성공":"실패");
		if(result==1) {
			//리다이렉트
			return "redirect:b_selectAll.do"; //sendRedirect
		}else {
			return "redirect:b_insert.do"; //sendRedirect
		}
	}//end b_insertOK
	
	@RequestMapping(value = "/b_update.do", method = RequestMethod.GET)
	public String b_update(BoardVO vo) {
		log.info("/b_update.do...{}",vo);
		
		return "board/update"; //servlet request.dispatcher랑 비슷한 역할을 해준다
	}//end b_update
	
	@RequestMapping(value = "/b_updateOK.do", method = RequestMethod.POST)
	public String b_updateOK(BoardVO vo,Model model) {
		log.info("/b_updateOK.do: {}",vo);
		
		int result = service.update(vo);
		
		log.info("수정결과:{}",result==1?"성공":"실패");
		if(result==1) {
			//리다이렉트
			return "redirect:b_selectOne.do?wnum="+vo.getWnum(); //sendRedirect
		}else {
			return "redirect:b_update.do?wnum="+vo.getWnum(); //sendRedirect
		}
	}//end b_updateOK
	
	@RequestMapping(value = "/b_deleteOK.do", method = RequestMethod.GET)
	public String b_deleteOK(BoardVO vo,Model model) {
		log.info("/b_deleteOK.do:{}",vo);

		int result = service.delete(vo);
		
		log.info("삭제결과:{}",result==1?"성공":"실패");
		if(result==1) {
			//리다이렉트
			return "redirect:b_selectAll.do"; //sendRedirect
		}else {
			return "redirect:b_selectOne.do?wnum="+vo.getWnum(); //sendRedirect
		}
	}//end b_deleteOK
	
	@RequestMapping(value = "/b_selectAll.do", method = RequestMethod.GET)
	public String b_selectAll() {
		log.info("/b_selectAll.do");
		
		return "board/selectAll"; //servlet request.dispatcher랑 비슷한 역할을 해준다
	}//end b_selectAll
	
	@RequestMapping(value = "/b_selectOne.do", method = RequestMethod.GET)
	public String b_selectOne(BoardVO vo,Model model) {
		log.info("/b_selectOne.do: {}",vo);
		
		return "board/selectOne"; //servlet request.dispatcher랑 비슷한 역할을 해준다
	}//end b_selectOne
}//end class
