package test.com.git.image.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.git.image.model.ImageVO;
import test.com.git.image.service.ImageService;

@Slf4j
@Controller
public class imageRestController {

	@Autowired
	ImageService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectAllImage.do", method = RequestMethod.GET)
	public List<ImageVO> jsonSelectAllImage(ImageVO vo) {
		log.info("jsonSelectAllImage.do..{}",vo);
		return service.selectAll(vo);
	}
	
}
