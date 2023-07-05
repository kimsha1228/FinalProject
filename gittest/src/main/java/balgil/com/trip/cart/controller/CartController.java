package balgil.com.trip.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.activity.model.ActivityVO;
import balgil.com.trip.cart.model.CartVO;
import balgil.com.trip.cart.service.CartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {

    @Autowired
    CartService cartService;

    @RequestMapping(method = RequestMethod.GET)
    public String cart() {
        log.info("/cart");
        return "cart";
    }

    @RequestMapping(value = "/selectAllCart", method = RequestMethod.GET)
    public String selectAllCart(CartVO vo, Model model) {
        log.info("/selectAllCart...{}", vo);
        List<CartVO> cartList = cartService.selectAllCart(vo);
        model.addAttribute("cartList", cartList);
        return "cart_list";
    }

    @RequestMapping(value = "/insertOneCart", method = RequestMethod.GET)
    public String insertOneCart(CartVO vo) {
        log.info("/insertOneCart...{}", vo);
        int result = cartService.insert(vo);
        log.info("result: {}", result);
        return "cart.insertOne";
    }

    @RequestMapping(value = "/deleteOneCart.do", method = RequestMethod.GET)
    public String deleteOneCart(@RequestParam("num") int act_id) {
        cartService.deleteOneCart(act_id);
        return "redirect:/cartList"; // 삭제 후 장바구니 페이지로 리다이렉트
    }

    @RequestMapping(value = "/deleteManyCart.do", method = RequestMethod.POST)
    public String deleteManyCart(@RequestParam("selectedActivities") List<Integer> act_id) {
        cartService.deleteManyCart(act_id);
        return "redirect:/cartList"; // 삭제 후 장바구니 페이지로 리다이렉트
    }
    
  
    @RequestMapping(value = "/noCart.do", method = RequestMethod.GET)
    public String noCart() {
        log.info("/noCart.do");

        return "cart/noCart";
    }

    @RequestMapping(value = "/cartList.do", method = RequestMethod.GET)
    public String cartList(Model model) {
        log.info("/cartList.do");

        // 카트 리스트 조회 로직을 수행하고 결과를 모델에 추가합니다.
//        List<CartVO> cartList = cartService.getCartList();
//        model.addAttribute("cartList", cartList);

        return "cart/cartList";
    }
    
    
    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    @ResponseBody
    public ActivityVO addToCart(@RequestBody ActivityVO activity, HttpSession session) {
    	List<ActivityVO> cartItems = (List<ActivityVO>) session.getAttribute("cartItems");

        // 장바구니에 상품을 추가합니다
        cartItems.add(activity);
      cartService.addToCart(activity, session);

      return activity; // 추가한 상품 정보 반환
    }

    
    
}
