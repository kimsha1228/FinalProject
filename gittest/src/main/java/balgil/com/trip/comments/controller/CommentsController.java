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
public class CommentsController {
	@Autowired
	CommentsService service;

	@Autowired
	ServletContext sContext;

	@RequestMapping(value = "/comments.do", method = RequestMethod.GET)
	public String comments() {
		log.info("/comments.do");
		return "comments";
	}

	@RequestMapping(value = "/selectMyComments.do", method = RequestMethod.GET)
	public String selectMyComments() {
		log.info("/selectMyComments.do");
		return "comments/selectMyComments";
	}

	@RequestMapping(value = "/selectAllComments.do", method = RequestMethod.GET)
	public String selectAllComments(Model model) {
		log.info("/selectAllComments.do");

		List<CommentsVO> vos = service.selectAll();

		model.addAttribute("vos", vos);

		return "comments/selectAll";
	}

	@RequestMapping(value = "/selectOneComments.do", method = RequestMethod.GET)
	public String selectOneComments(CommentsVO vo, Model model) {
		log.info("/selectOneComments.do...{}", vo);

		CommentsVO vo2 = service.selectOne(vo);
		log.info("vo2:{}", vo2);

		model.addAttribute("vo2", vo2);

		return "comments/selectOne";
	}

	@RequestMapping(value = "/insertComments.do", method = RequestMethod.GET)
	public String insertComments(CommentsVO vo) {
		log.info("/insertComments.do....");

		return "comments/insertComments";
	}

	@RequestMapping(value = "/insertCommentsOK.do", method = RequestMethod.POST)
	public String insertCommentsOK(CommentsVO vo) {
		log.info("/insertCommentsOK.do...{}", vo);

		int result = service.insert(vo);
		log.info("result...{}", result);

		if (result == 1) {
			return "redirect:selectAllComments.do";
		} else {
			return "redirect:insertComments.do";
		}
	}

	@RequestMapping(value = "/updateComments.do", method = RequestMethod.GET)
	public String updateComments(CommentsVO vo, Model model) {
		log.info("/updateComments.do...{}", vo);

		CommentsVO vo2 = service.selectOne(vo);
		log.info("vo2:{}", vo2);

		model.addAttribute("vo2", vo2);

		return "comments/updateComments";
	}
//
//	@RequestMapping(value = "/updateCommentsOK.do", method = RequestMethod.POST)
//	public String updateCommentsOK(CommentsVO vo, @RequestParam("file") MultipartFile file) throws IOException {
//	    log.info("/updateCommentsOK.do...{}", vo);
//
//	    String originalFilename = file.getOriginalFilename();
//	    int fileNameLength = originalFilename.length();
//	    log.info("originalFilename:{}", originalFilename);
//	    log.info("fileNameLength:{}", fileNameLength);
//
//	    if (fileNameLength != 0) {
//	        vo.setAct_id(originalFilename);
//	        // 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
//	        String realPath = sContext.getRealPath("resources/uploadimg");
//	        log.info("realPath : {}", realPath);
//
//	        File f = new File(realPath + "\\" + vo.getAct_id());
//	        file.transferTo(f);
//
//	        // 썸네일 이미지 생성
//	        BufferedImage originalBufferImg = ImageIO.read(f);
//	        BufferedImage thumbBufferImg = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
//	        Graphics2D graphics = thumbBufferImg.createGraphics();
//	        graphics.drawImage(originalBufferImg, 0, 0, 50, 50, null);
//
//	        File thumbFile = new File(realPath + "/thumb_" + vo.getAct_id());
//	        String formatName = vo.getAct_id().substring(vo.getAct_id().lastIndexOf(".") + 1);
//	        log.info("formatName : {}", formatName);
//	        ImageIO.write(thumbBufferImg, formatName, thumbFile);
//	    }
//
//	    log.info("{}", vo);
//
//	    int result = service.update(vo);
//	    log.info("result:{}", result);
//
//	    if (result == 1) {
//	        return "redirect:selectOneComments.do?Act_id=" + vo.getAct_id();
//	    } else {
//	        return "redirect:updateComments.do?Act_id=" + vo.getAct_id();
//	    }
//	}



	@RequestMapping(value = "/deleteCommentsOK.do", method = RequestMethod.GET)
	public String deleteCommentsOK(@RequestParam("user_id") String user_id, CommentsVO vo) {
	    log.info("/deleteCommentsOK.do...{}", vo);

	    int result = service.delete(vo);

	    log.info("result...{}", result);

	    return "forward:/selectAllComments.do?user_id=" + user_id;
	}




}