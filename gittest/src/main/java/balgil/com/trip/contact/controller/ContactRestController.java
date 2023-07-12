package balgil.com.trip.contact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.contact.model.ContactVO;
import balgil.com.trip.contact.service.ContactService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ContactRestController {

	
	@Autowired
	ContactService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectAllContact.do", method = RequestMethod.GET)
	public List<ContactVO> jsonSelectAllContact() {
		log.info("jsonSelectAllContact.do..");
		return service.selectAll();	
	}
}
