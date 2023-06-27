package test.com.git.activity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.git.activity.model.ActivityDAO;

@Service
public class ActivityService {
 
	@Autowired
	ActivityDAO dao;
	
}
