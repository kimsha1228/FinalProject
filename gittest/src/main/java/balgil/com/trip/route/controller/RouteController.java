package balgil.com.trip.route.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.route.service.RouteService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RouteController {

	@Autowired
	RouteService service;

	@RequestMapping(value = "/insertRoute.do", method = RequestMethod.GET)
	public String insertRoute() {
		log.info("insertRoute.jsp로 이동");
		return "route/insertRoute";
	}

	@RequestMapping(value = "/insertRouteOk.do", method = RequestMethod.GET)
	public String insertRouteOk() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/updateRoute.do", method = RequestMethod.GET)
	public String updateRoute() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/updateRouteOk.do", method = RequestMethod.GET)
	public String updateRouteOk() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/deleteRouteOk.do", method = RequestMethod.GET)
	public String deleteRouteOk() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/selectAllRoute.do", method = RequestMethod.GET)
	public String selectAllRoute() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/selectOneRoute.do", method = RequestMethod.GET)
	public String selectOneRoute() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/selectOneUserRoute.do", method = RequestMethod.GET)
	public String selectOneUserRoute() {
		// vcountUpRoute는 여기에 들어감
		return "test/Route_test";
	}

	@RequestMapping(value = "/searchRoute.do", method = RequestMethod.GET)
	public String searchRoute() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/likeUpRoute.do", method = RequestMethod.GET)
	public String likeUpRoute() {

		return "test/Route_test";
	}

}
