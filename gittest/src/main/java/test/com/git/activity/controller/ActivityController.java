package test.com.git.activity.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.git.activity.model.ActivityVO;
import test.com.git.activity.service.ActivityService;
import test.com.git.image.service.ImageService;

@Slf4j
@Controller
public class ActivityController {
	
	@ExceptionHandler(DuplicateKeyException.class)
	public String insertActOK_exception() {
		log.info("제목이 중복된다 DuplicateKeyException");
		return "activity/insertAct";
	}
	
	@Autowired
	ActivityService service;
	
	//이미지 테이블 업로드용 서비스
	@Autowired
	ImageService imgService;

	@Autowired
	ServletContext sContext;

	@RequestMapping(value = "/insertAct.do", method = RequestMethod.GET)
	public String insertAct() {
		log.info("insertAct.jsp로 이동");
		return "activity/insertAct";
	}
	
	@RequestMapping(value = "/insertActOk.do", method = RequestMethod.POST)
	public String insertActOK(ActivityVO vo) throws IllegalStateException, IOException {
		log.info("insertActOK로 온 데이터:{}", vo);
		log.info("file의 갯수 1이면 파일이 있을수도 없을수도 있음:{}", vo.getFile().size());

		
//		//파일이 없으면 default.png를 대신 image테이블에 넣을 예정
//		if (vo.getFile().get(0).getSize()==0) {
//			log.info("파일이 비었어");
//		}else {
//			//파일의 갯수만큼 반복!
//			for (MultipartFile vos : vo.getFile()) {
//				String getOriginalFilename = vos.getOriginalFilename();
//				int fileNameLength = vos.getOriginalFilename().length();
//				log.info("getOriginalFilename:{}", getOriginalFilename);
//				log.info("fileNameLength:{}", fileNameLength);
//				
//				// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
//				String realPath = sContext.getRealPath("resources/uploadimg");
//				log.info("realPath : {}", realPath);
//
//				File f = new File(realPath + "\\" + getOriginalFilename);
//				vos.transferTo(f);
//				
//				ImageVO imageVO = new ImageVO();
//				//TODO: ACT_ID가 필요하므로 여기는 나중엔
//			}
//		}
		int result = service.insert(vo);
		if(result==1) {
			log.info("Insert쿼리 성공!");
		}else {
			log.info("Insert쿼리 실패..");
		}

		if (result == 1) {
			return "redirect:selectAllAct.do";
		} else {
			return "redirect:insertAct.do";
		}

	}

	@RequestMapping(value = "/updateAct.do", method = RequestMethod.GET)
	public String updateAct() {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/updateActOk.do", method = RequestMethod.GET)
	public String updateActOK() {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/deleteActOk.do", method = RequestMethod.GET)
	public String deleteActOK() {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/selectAllAct.do", method = RequestMethod.GET)
	public String selectAllAct(Locale locale, Model model) {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/selectOneAct.do", method = RequestMethod.GET)
	public String selectOneAct(Locale locale, Model model) {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/selectAllUserAct.do", method = RequestMethod.GET)
	public String selectAllUserAct(Locale locale, Model model) {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/selectOneUserAct.do", method = RequestMethod.GET)
	public String selectOneUserAct(Locale locale, Model model) {
		// vcountUpAct도 필요
		return "test/Activity_test";
	}

	@RequestMapping(value = "/searchAct.do", method = RequestMethod.GET)
	public String searchAct(Locale locale, Model model) {
		return "test/Activity_test";
	}

	@RequestMapping(value = "/searchActHome.do", method = RequestMethod.GET)
	public String searchActHome(Locale locale, Model model) {
		return "test/Activity_test";
	}

}
