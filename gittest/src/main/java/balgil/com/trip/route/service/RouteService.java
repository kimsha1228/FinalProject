package balgil.com.trip.route.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.route.model.RouteDAO;

@Service
public class RouteService {

	@Autowired
	RouteDAO dao;
	
}
