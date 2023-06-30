package balgil.com.trip.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import balgil.com.trip.answer.service.AnswerService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AnswerRestController {
	
	@Autowired
	AnswerService service;
	
}
