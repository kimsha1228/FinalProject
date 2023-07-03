package balgil.com.trip.route.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.route.model.RouteVO;
import balgil.com.trip.route.service.RouteService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RouteController {

	@Autowired
	RouteService service;

	@Autowired
	ServletContext sContext;
	
	@RequestMapping(value = "/insertRoute.do", method = RequestMethod.GET)
	public String insertRoute() {
		log.info("insertRoute.jsp로 이동");
		return "route/insertRoute";
	}

	@RequestMapping(value = "/insertRouteOk.do", method = RequestMethod.POST)
	public String insertRouteOk(RouteVO vo) throws IllegalStateException, IOException {
		log.info("insertRouteOk..{}",vo);
		

		//로컬 이미지 생성
		String getOriginalFilename = vo.getFile().getOriginalFilename();
		int fileNameLength = vo.getFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		if (getOriginalFilename.length() == 0) {
			vo.setImg("default.png");
		} else {
			vo.setImg(getOriginalFilename);
			// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f = new File(realPath + "\\" + vo.getImg());
			vo.getFile().transferTo(f);

			//// create thumbnail image/////////
			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);

			File thumb_file = new File(realPath + "/thumb_" + vo.getImg());
			String formatName = vo.getImg().substring(vo.getImg().lastIndexOf(".") + 1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);

		} // end else
		
		int result = service.insert(vo);
		
		log.info("루트 삽입결과:{}",result);
		
		if (result == 1) {
			return "redirect:selectAllRoute.do";
		} else {
			return "redirect:insertRoute.do";
		}
	}

	@RequestMapping(value = "/updateRoute.do", method = RequestMethod.GET)
	public String updateRoute() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/updateRouteOk.do", method = RequestMethod.GET)
	public String updateRouteOk() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/deleteRouteOk.do", method = RequestMethod.GET)
	public String deleteRouteOk() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/selectAllRoute.do", method = RequestMethod.GET)
	public String selectAllRoute() {
		log.info("selectAllRoute.do..");
		return "route/selectAllRoute";
	}

	@RequestMapping(value = "/selectOneRoute.do", method = RequestMethod.GET)
	public String selectOneRoute() {

		return "test/Route_test";
	}

	@RequestMapping(value = "/selectOneUserRoute.do", method = RequestMethod.GET)
	public String selectOneUserRoute() {
		// vcountUpRoute는 여기에 들어감
		return "test/Route_test";
	}

	@RequestMapping(value = "/likeUpRoute.do", method = RequestMethod.GET)
	public String likeUpRoute() {

		return "test/Route_test";
	}

}
