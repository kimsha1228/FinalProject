package test.com.restapi.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.restapi.member.model.MemberVO;
import test.com.restapi.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class MemberRestController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/json_vo.do", method = RequestMethod.GET)
	@ResponseBody
	public MemberVO json_vo() {
		log.info("/json_vo.do...");
		
		//selectOne에 쓰이는!
		MemberVO vo = new MemberVO(1, "tester", "hi11", "Roh노", "011");
		log.info(vo.toString());
		
		return vo;
	}
	@RequestMapping(value = "/json_selectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public MemberVO json_selectOne(MemberVO vo) {
		log.info("/json_selectOne.do...{}",vo);
		
		MemberVO vo2 = service.selectOne(vo);
		log.info("{}",vo2);
		
		return vo2;
	}
	@RequestMapping(value = "/json_vos.do", method = RequestMethod.GET)
	@ResponseBody
	public List<MemberVO> json_vos() {
		log.info("/json_vos.do...");
		
		List<MemberVO> vos = new ArrayList<MemberVO>();
		for (int i = 0; i < 5; i++) {
			MemberVO vo = new MemberVO(1+i, "tester"+i, "hi11"+i, "Roh노"+i, "011"+i);
			vos.add(vo);
		}
		log.info(vos.toString());

		return vos;
	}
	@RequestMapping(value = "/json_selectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<MemberVO> json_selectAll() {
		log.info("/json_vos.do...");
		
		List<MemberVO> vos = service.selectAll();

		return vos;
	}
	
	@RequestMapping(value = "/json_searchList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<MemberVO> json_searchList(String searchKey,String searchWord) {
		log.info("/json_searchList.do...");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);
		
		List<MemberVO> vos = service.searchList(searchKey,searchWord);
		log.info("vos.size():{}",vos.size());
		return vos;
	}
	
	@RequestMapping(value = "/json_result.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> json_result() {
		log.info("/json_result.do...");
		
		Map<String, String> result =new HashMap<String, String>();
		result.put("result", "OK");
		return result;
	}
	@RequestMapping(value = "/json_idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> json_idCheck(MemberVO vo) {
		log.info("/json_idCheck.do...{}",vo);
		
		List<MemberVO> vos= service.idCheck(vo);
		log.info("{}",vos);//null or not null
		

		Map<String, String> result =new HashMap<String, String>();
		if (vos.isEmpty()) { // 비어있으면 중복이 안된것
			result.put("result", "OK");
		} else {
			result.put("result", "NOT OK");
		}
		return result;
	}
	@RequestMapping(value = "/json_insertOK.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Integer> json_insertOK(MemberVO vo) {
		log.info("/json_insertOK.do...{}",vo);
		
		int result = service.insert(vo);
		log.info("result:{}",result);//null or not null
		

		Map<String, Integer> map =new HashMap<String, Integer>();
		if (result==1) { // 비어있으면 중복이 안된것
			map.put("result", 1);
		} else {
			map.put("result", 0);
		}
		return map;
	}
//	@RequestMapping(value = "/json_map.do", method = RequestMethod.GET)
//	@ResponseBody
//	public Map<String,List<MemberVO>> json_map() {
//		log.info("/json_map.do...");
//		
//		List<MemberVO> vos = new ArrayList<MemberVO>();
//		for (int i = 0; i < 5; i++) {
//			MemberVO vo = new MemberVO(1+i, "tester"+i, "hi11"+i, "Roh노"+i, "011"+i);
//			vos.add(vo);
//		}
//		log.info(vos.toString());
//
//		Map<String,List<MemberVO>> map = new HashMap<String, List<MemberVO>>();
//		map.put("vos", vos);
//		return map;
//	}
}
