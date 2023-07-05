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
		return "test/map_test/1";
	}
	@RequestMapping(value = "/map_test02.do", method = RequestMethod.GET)
	public String map_test2() {
		return "test/map_test/2";
	}
	@RequestMapping(value = "/map_test03.do", method = RequestMethod.GET)
	public String map_test3() {
		return "test/map_test/3";
	}
	@RequestMapping(value = "/map_test04.do", method = RequestMethod.GET)
	public String map_test4() {
		return "test/map_test/4";
	}
	@RequestMapping(value = "/map_test05.do", method = RequestMethod.GET)
	public String map_test5() {
		return "test/map_test/5";
	}
	@RequestMapping(value = "/map_test06.do", method = RequestMethod.GET)
	public String map_test6() {
		return "test/map_test/6";
	}
}
