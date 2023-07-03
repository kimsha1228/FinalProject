package balgil.com.trip.route.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.route.model.RouteDAO;
import balgil.com.trip.route.model.RouteVO;

@Service
public class RouteService {

	@Autowired
	RouteDAO dao;

	public int insert(RouteVO vo) {
		return dao.insert(vo);
	}
	
}
