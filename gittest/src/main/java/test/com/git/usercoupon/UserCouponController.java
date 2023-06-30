package test.com.git.usercoupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class UserCouponController {
	
	@Autowired
	UserCouponService service;
	
	@ResponseBody
	@RequestMapping(value = "/userCouponSelectAll.do", method = RequestMethod.GET)
	public List<UserCouponVO> userCouponSelectAll(UserCouponVO vo) {
		log.info("userCouponSelectAll.do...{}", vo);
		
		List<UserCouponVO> vos = service.selectAll(vo);
		log.info("vos: {}", vos);
		
		return vos;
	}
	
}
