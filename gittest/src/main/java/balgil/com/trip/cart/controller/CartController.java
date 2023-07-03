package balgil.com.trip.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import balgil.com.trip.cart.model.CartVO;
import balgil.com.trip.cart.service.CartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {

    @Autowired
    CartService cartService;

    @RequestMapping(value = "/selectAllCart.do", method = RequestMethod.GET)
    public String selectAllCart(CartVO vo, Model model) {
        log.info("/selectAllCart.do...{}", vo);
        List<CartVO> cartList = cartService.selectAllCart(vo);
        model.addAttribute("cartList", cartList);
        return "cart_list";
    }

    @RequestMapping(value = "/insertOneCart.do", method = RequestMethod.GET)
    public String insertOneCart(CartVO vo) {
        log.info("/insertOneCart.do...{}", vo);
        int result = cartService.insert(vo);
        log.info("result: {}", result);
        return "cart.insertOne";
    }

    @RequestMapping(value = "/deleteCart.do", method = RequestMethod.GET)
    public String deleteCart(CartVO vo) {
        log.info("/deleteCart.do...{}", vo);
        int result = cartService.delete(vo);
        log.info("result: {}", result);
        return "cart.insert";
    }

    
}

    

