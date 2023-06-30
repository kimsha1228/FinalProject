package balgil.com.trip;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

<<<<<<< HEAD
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Autowired
	HttpSession session;
	
	@RequestMapping(value = {"/","/home.do"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("merge test 아 왜 안 돼");
		log.info("아아아아아아아아아아 어떻게 하는 겨");
		log.info("hihihi hello{}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/Activity_test.do", method = RequestMethod.GET)
	public String Activity_test(Locale locale, Model model) {
		log.info("Activity 테스트용 jsp로 이동");
		
		//임시 로그인용 변수 추후 변경하거나 삭제할 예정
		session.setAttribute("user_id", "seller02");
		
		return "test/Activity_test";
	}
	
	@RequestMapping(value = "/Route_test.do", method = RequestMethod.GET)
	public String Route_test(Locale locale, Model model) {
		log.info("Route 테스트용 jsp로 이동");
		return "test/Route_test";
	}
=======
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","/home.do"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("hihihi hello{}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
>>>>>>> refs/heads/seoha
}
