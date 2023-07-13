package balgil.com.trip.comments.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import balgil.com.trip.comments.model.CommentsVO;
import balgil.com.trip.comments.service.CommentsService;
import balgil.com.trip.reservation.model.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentsRestController {

	@Autowired
	CommentsService service;
	
	@RequestMapping(value = "/rest_api.do", method = RequestMethod.GET)
	public String rest_api() {
		log.info("/rest_api.do");

		return "rest_api";
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_comments_selectAll.do", method = RequestMethod.GET)
	public List<CommentsVO> json_comments_selectAll() {
		log.info("/json_comments_selectAll.do");
		
		List<CommentsVO> vos = service.selectAll();
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_comments_selectOne.do", method = RequestMethod.GET)
	public CommentsVO json_comments_selectOne(CommentsVO vo) {
		log.info("/json_comments_selectOne.do...{}",vo);
		
		CommentsVO vo2 = service.selectOne(vo);
		if(vo2==null) vo2 = vo;
		return vo2;
	}

}