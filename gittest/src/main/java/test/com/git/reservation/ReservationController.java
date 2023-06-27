package test.com.git.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReservationController {

	@Autowired
	ReservationService service;
	
	@RequestMapping(value = "/rest_api.do", method = RequestMethod.GET)
	public String rest_api() {
		log.info("/rest_api.do");

		return "rest_api";
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_mv_selectAll.do", method = RequestMethod.GET)
	public List<ReservationVO> json_mv_selectAll() {
		log.info("/json_mv_selectAll.do");
		
		List<ReservationVO> vos = service.selectAll();
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_mv_searchList.do", method = RequestMethod.GET)
	public List<ReservationVO> json_mv_searchList(String searchKey, String searchWord) {
		log.info("/json_mv_searchList.do");
		log.info("searchKey:{}", searchKey);
		log.info("searchWord:{}", searchWord);
		
		List<ReservationVO> vos = service.searchList(searchKey, searchWord);
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_mv_selectOne.do", method = RequestMethod.GET)
	public ReservationVO json_mv_selectOne(ReservationVO vo) {
		log.info("/json_mv_selectOne.do...{}",vo);
		
		ReservationVO vo2 = service.selectOne(vo);
		if(vo2==null) vo2 = vo;
		return vo2;
	}

}
