package balgil.com.trip.users.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.pointhistory.service.PointHistoryService;
import balgil.com.trip.users.model.UsersVO;
import balgil.com.trip.users.service.UsersService;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class UsersController {

	@Autowired
	UsersService service;

	@Autowired
	PointHistoryService his_service;
	
	@Autowired
	ServletContext sContext;
	
	@Autowired
	HttpSession session;

	@RequestMapping(value = "/u_selectAll.do", method = RequestMethod.GET)
	public String u_selectAll(Model model) {
		log.info("/u_selectAll.do");

		List<UsersVO> vos = service.selectAll();

		model.addAttribute("vos", vos);

		return "users/selectAll";
	}

	@RequestMapping(value = "/u_searchList.do", method = RequestMethod.GET)
	public String u_searchList(String searchKey,String searchWord,Model model) {
		log.info("/u_searchList.do...searchKey:{}",searchKey);
		log.info("/u_searchList.do...searchWord:{}",searchWord);

		List<UsersVO> vos = service.searchList(searchKey,searchWord);

		model.addAttribute("vos", vos);
		
		return "users/selectAll";
	}
	
	@RequestMapping(value = "/u_selectOne.do", method = RequestMethod.GET)
	public String u_selectOne(UsersVO vo, Model model) {
		log.info("/u_selectOne.do...{}", vo);

		UsersVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "users/selectOne";
	}

	@RequestMapping(value = "/u_insert.do", method = RequestMethod.GET)
	public String m_insert() {
		log.info("/u_insert.do");

		return "users/insert";
	}

	@RequestMapping(value = "/u_insertOK.do", method = RequestMethod.POST)
	public String u_insertOK(UsersVO vo) {
		log.info("/u_insertOK.do...{}", vo);
		
		String first_name = vo.getFirst_name();
		String last_name = vo.getLast_name();
		String eng_name = first_name+" "+last_name;
		vo.setEng_name(eng_name);
		
		String tel1 = vo.getTel1();
		String tel2 = vo.getTel2();
		String tel3 = vo.getTel3();
		String tel = tel1+"-"+tel2+"-"+tel3;
		vo.setTel(tel);
		
		String email1 = vo.getEmail1();
		String email2 = vo.getEmail2();
		String email = email1+"@"+email2;
		vo.setEmail(email);
		
		int type = 3;
		if(vo.getType()!=0) type = vo.getType();
		vo.setType(type);
		
		int result = service.insert(vo);
		log.info("result: {}", result);
		
		
		if (result == 1) {
			return "redirect:home.do";
		} else {
			return "redirect:u_insert.do";
		}
	}

	@RequestMapping(value = "/u_update.do", method = RequestMethod.GET)
	public String u_update(UsersVO vo, Model model) {
		log.info("/u_update.do...{}", vo);

		UsersVO users = service.selectOne(vo);
		log.info("users: {}", users);
		
		String eng_name = users.getEng_name();
		int idx = eng_name.indexOf(" ");
		String first_name = eng_name.substring(0, idx);
		String last_name = eng_name.substring(idx+1);
		users.setFirst_name(first_name);
		users.setLast_name(last_name);
		
		String tel = users.getTel();
		String telnum[] = tel.split("-");
		String tel1 = telnum[0];
		String tel2 = telnum[1];
		String tel3 = telnum[2];
		users.setTel1(tel1);
		users.setTel2(tel2);
		users.setTel3(tel3);
		
		String email = users.getEmail();
		int idx1 = email.indexOf("@");
		String email1 = email.substring(0, idx1);
		String email2 = email.substring(idx1+1);
		users.setEmail1(email1);
		users.setEmail2(email2);

		model.addAttribute("users", users);

		return "users/update";
	}
	
	@RequestMapping(value = "/u_updateOK.do", method = RequestMethod.POST)
	public String u_updateOK(UsersVO vo) throws IllegalStateException, IOException {
		log.info("/u_updateOK.do...{}", vo);
		
		String getOriginalFilename = vo.getFile().getOriginalFilename();
		int fileNameLength = vo.getFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		if (getOriginalFilename.length() != 0) {

			vo.setImg(getOriginalFilename);
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f = new File(realPath + "\\" + vo.getImg());
			vo.getFile().transferTo(f);

			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);

			File thumb_file = new File(realPath + "/thumb_" + vo.getImg());
			String formatName = vo.getImg().substring(vo.getImg().lastIndexOf(".") + 1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);

		} else {
			vo.setImg("default.png");
		}
		
		String first_name = vo.getFirst_name();
		String last_name = vo.getLast_name();
		String eng_name = first_name+" "+last_name;
		vo.setEng_name(eng_name);
		
		String tel1 = vo.getTel1();
		String tel2 = vo.getTel2();
		String tel3 = vo.getTel3();
		String tel = tel1+"-"+tel2+"-"+tel3;
		vo.setTel(tel);
		
		String email1 = vo.getEmail1();
		String email2 = vo.getEmail2();
		String email = email1+"@"+email2;
		vo.setEmail(email);
		
		int type = 3;
		if(vo.getType()!=0) type = vo.getType();
		vo.setType(type);

		int result = service.update(vo);
		log.info("result: {}", result);
		
		if (result == 1) {
			return "redirect:u_selectOne.do?user_id=" + vo.getUser_id();//리다이렉트 다시 해줘야함
		} else {
			return "redirect:u_update.do?user_id=" + vo.getUser_id();
		}
	}
	
	@RequestMapping(value = "/u_deleteOK.do", method = RequestMethod.GET)
	public String u_deleteOK(UsersVO vo) {
		log.info("/u_deleteOK.do...{}", vo);
		
		UsersVO users = service.selectUsersRecord(vo); //cascade..?
		
		int result = 0;
		if(users!=null) {
			result = service.typeUpdate(vo);
		} else {
			result = service.delete(vo);
		}

		if (result == 1) {
			session.invalidate();
			return "redirect:home.do";
		} else {
			return "redirect:myInfo.do?user_id=" + vo.getUser_id();
		}

	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(String message, Model model) {
		log.info("/login.do....{}", message);

		if(message!=null) message = "아이디 또는 패스워드를 확인하세요";
		model.addAttribute("message", message);
		
		return "users/login";
	}

	@RequestMapping(value = "/loginOK.do", method = RequestMethod.POST)
	public String loginOK(UsersVO vo) {
		log.info("/loginOK.do...{}",vo);
		
		UsersVO vo2 = service.login(vo);
		log.info("vo2...{}",vo2);
		
		if(vo2 == null || vo2.getType() == 4) {	//4번 탈퇴 처리된 회원은 로그인 불가
			return "redirect:login.do?message=fail";
		}else {
			session.setAttribute("user_id", vo2.getUser_id());
			return "redirect:home.do";
		}
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout() {
		log.info("/logout.do");
		
		session.invalidate();

		return "redirect:home.do";
	}
	
	//마이페이지, 마이인포 다 세션 연결하면 세션으로 아이디 넘겨받기
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(UsersVO vo) {
		log.info("/myPage.do...");

		return "users/myPage";
	}
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo(UsersVO vo, Model model, HttpServletRequest request) {
		log.info("/myInfo.do...{}", vo);
		
		UsersVO users = service.selectOne(vo);
		
		String eng_name = users.getEng_name();
		int idx = eng_name.indexOf(" ");
		String first_name = eng_name.substring(0, idx);
		String last_name = eng_name.substring(idx+1);
		users.setFirst_name(first_name);
		users.setLast_name(last_name);
		
		String tel = users.getTel();
		String telnum[] = tel.split("-");
		String tel1 = telnum[0];
		String tel2 = telnum[1];
		String tel3 = telnum[2];
		users.setTel1(tel1);
		users.setTel2(tel2);
		users.setTel3(tel3);
		
		String email = users.getEmail();
		int idx1 = email.indexOf("@");
		String email1 = email.substring(0, idx1);
		String email2 = email.substring(idx1+1);
		users.setEmail1(email1);
		users.setEmail2(email2);
		
		model.addAttribute("users", users);
		
		return "users/myInfo";
	}
}