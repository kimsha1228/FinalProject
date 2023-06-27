package test.com.git;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

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
		return "test/Activity_test";
	}
	
	@RequestMapping(value = "/Route_test.do", method = RequestMethod.GET)
	public String Route_test(Locale locale, Model model) {
		log.info("Route 테스트용 jsp로 이동");
		return "test/Route_test";
	}
}
