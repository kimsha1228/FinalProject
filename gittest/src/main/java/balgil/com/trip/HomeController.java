package balgil.com.trip;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
		log.info("hello{}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/Activity_test.do", method = RequestMethod.GET)
	public String Activity_test(Locale locale, Model model) {
		log.info("Activity 테스트용 jsp로 이동");
		
		return "test/Activity_test";
	}
	
	@RequestMapping(value = "/Route_test.do", method = RequestMethod.GET)
	public String Route_test(Locale locale, Model model) {
		log.info("Route 테스트용 jsp로 이동");
		
		return "test/Route_test";
	}
	
	@RequestMapping(value = "/map_test.do", method = RequestMethod.GET)
	public String map_test(Locale locale, Model model) {
		log.info("map 테스트용 jsp로 이동");
		
		return "test/map_test";
	}
	
	@RequestMapping(value = "/Faq_test.do", method = RequestMethod.GET)
	public String Faq_test(Locale locale, Model model) {
		log.info("Faq 테스트용 jsp로 이동");
		
		return "test/Faq_test";
	}
	
	@RequestMapping(value = "/Contact_test.do", method = RequestMethod.GET)
	public String Contact_test(Locale locale, Model model) {
		log.info("Contact 테스트용 jsp로 이동");
		
		return "test/Contact_test";
	}
}

