package balgil.com.trip.wishlist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.wishlist.model.WishListVO;
import balgil.com.trip.wishlist.service.WishListService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WishListController {

	@Autowired
	WishListService service;

	@RequestMapping(value = "/wishlist.do", method = RequestMethod.GET)
	public String wishlist() {
		log.info("/wishlist.do");

		return "wishlist";
	}

	@RequestMapping(value = "/selectAllWishList.do", method = RequestMethod.GET)
	public String selectAllWishList(WishListVO vo, Model model) {
		log.info("/selectAllWishList.do");

		List<WishListVO> vos1 = service.selectAll(vo);
		log.info("{}", vos1);

		model.addAttribute("vos1", vos1);

		return "wishlist/wishlistSelectAll";
	}

	@RequestMapping(value = "/deleteOK.do", method = RequestMethod.GET)
	public String deleteOK(WishListVO vo, Model model) {
		int result = service.delete(vo);
		if (result == 1) {
			List<WishListVO> vos1 = service.selectAll(vo);
			model.addAttribute("vos1", vos1);
			return "wishlist/wishlistSelectAll";
		} else {
			return "redirect:selectOne.do?user_id=" + vo.getUser_id();
		}
	}

}