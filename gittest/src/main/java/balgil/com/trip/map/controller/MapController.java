package balgil.com.trip.map.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {

	@Autowired
	HttpSession session;
	@RequestMapping(value = "/map_test01.do", method = RequestMethod.GET)
	public String map_test() {
		return "test/map_test/01";
	}
	@RequestMapping(value = "/map_test02.do", method = RequestMethod.GET)
	public String map_test2() {
		return "test/map_test/02";
	}
	@RequestMapping(value = "/map_test03.do", method = RequestMethod.GET)
	public String map_test3() {
		return "test/map_test/03";
	}
	@RequestMapping(value = "/map_test04.do", method = RequestMethod.GET)
	public String map_test4() {
		return "test/map_test/04";
	}
	@RequestMapping(value = "/map_test05.do", method = RequestMethod.GET)
	public String map_test5() {
		return "test/map_test/05";
	}
	@RequestMapping(value = "/map_test06.do", method = RequestMethod.GET)
	public String map_test6() {
		return "test/map_test/06";
	}
	@RequestMapping(value = "/map_test07.do", method = RequestMethod.GET)
	public String map_test7() {
		return "test/map_test/07";
	}
	@RequestMapping(value = "/map_test08.do", method = RequestMethod.GET)
	public String map_test8() {
		return "test/map_test/08";
	}
	@RequestMapping(value = "/map_test09.do", method = RequestMethod.GET)
	public String map_test9() {
		return "test/map_test/09";
	}
	@RequestMapping(value = "/map_test10.do", method = RequestMethod.GET)
	public String map_test10() {
		return "test/map_test/10";
	}
	@RequestMapping(value = "/map_test11.do", method = RequestMethod.GET)
	public String map_test11() {
		return "test/map_test/11";
	}
}
