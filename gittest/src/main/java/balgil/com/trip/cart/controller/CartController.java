package balgil.com.trip.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
    public String deleteCart(CartVO vo) {
        log.info("/deleteCart...{}", vo);
        int result = cartService.delete(vo);
        log.info("result: {}", result);
        return "cart.insert";
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
}
