package test.com.git.route.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.git.route.model.RouteDAO;

@Service
public class RouteService {

	@Autowired
	RouteDAO dao;
	
}
