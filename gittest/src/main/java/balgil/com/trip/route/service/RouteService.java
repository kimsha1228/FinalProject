package balgil.com.trip.route.service;

import java.util.List;

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

	public List<RouteVO> selectAll(RouteVO vo) {
		return dao.selectAll(vo);
	}

	public List<RouteVO> searchRoute(String seller_id, String searchKey, String searchWord) {
		return dao.searchList(seller_id, searchKey, searchWord);
	}

	public RouteVO selectOne(RouteVO vo) {
		return dao.selectOne(vo);
	}

	public int update(RouteVO vo) {
		return dao.update(vo);
	}
	
}
