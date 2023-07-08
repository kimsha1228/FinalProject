package balgil.com.trip.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import balgil.com.trip.activity.model.ActivityVO;
import balgil.com.trip.activity.service.ActivityService;
import balgil.com.trip.cart.model.CartVO;
import balgil.com.trip.cart.service.CartService;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class CartController {

    @Autowired
    CartService cartService;
    private ActivityService activityService;
    
    @Autowired
    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    @RequestMapping(value = "/cart.do", method = RequestMethod.GET)
    public String cart() {
        log.info("/cart");
        return "cart";
    }

    @RequestMapping(value = "/selectAllCart.do", method = RequestMethod.GET)
    public String selectAllCart(CartVO vo, Model model) {
        log.info("/selectAllCart...{}", vo);
        List<CartVO> cartList = cartService.selectAllCart(vo);
        
        model.addAttribute("cartList", cartList);
        return "cart/cartListTest";
    }

    @RequestMapping(value = "/insertOneCart.do", method = RequestMethod.POST)
    public String insertOneCart(CartVO vo) {
        log.info("/insertOneCart...{}", vo);
        
        CartVO vo1 = cartService.selectOne(vo);
        log.info("result: {}", vo1);
        
        int result_insert = 0;
        int result_insertUp = 0;
        if(vo1!=null) {
        	vo.setId(vo1.getId());
        	result_insertUp = cartService.insertCountUp(vo);
        }else {
        	result_insert = cartService.insertOne(vo);
        }
        log.info("result_insert: {}", result_insert);
        log.info("result_insertUp: {}", result_insertUp);
        
        
        return "home";//위에서 리다이렉트 if(result_insertUp==1){return ~~;}해주기
    }
    
    
    @RequestMapping(value = "/updateOneCart.do", method = RequestMethod.GET)
    public String updateOneCart(CartVO vo) {
    	log.info("updateOneCart: {}", vo);
    	int result_update = cartService.updateOneCart(vo);	//장바구니에서 수량 조절
//    	if(result_update==1) {
//    		
//    	}
    	log.info("result_update: {}",result_update);
    	
    	return "redirect:selectAllCart.do?user_id=john123"; // 삭제 후 장바구니 페이지로 리다이렉트
    }

    @RequestMapping(value = "/deleteOneCart.do", method = RequestMethod.GET)
    public String deleteOneCart(CartVO vo) {
    	log.info("deleteOneCart: {}", vo);
    	int result_delete = cartService.deleteOneCart(vo);
    	log.info("result: {}", result_delete);
    	return "redirect:selectAllCart.do?user_id=john123"; // 삭제 후 장바구니 페이지로 리다이렉트
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

        // 카트 리스트 조회 로직을 수행하고 결과를 모델에 추가
//        List<CartVO> cartList = cartService.getCartList();
//        model.addAttribute("cartList", cartList);

        return "cart/cartList";
    }
    
//    
//    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
//    @ResponseBody
//    public ActivityVO addToCart(@RequestBody ActivityVO activity, HttpSession session) {
//    	List<ActivityVO> cartItems = (List<ActivityVO>) session.getAttribute("cartItems");
//
//        // 장바구니에 상품을 추가
//        cartItems.add(activity);
//      cartService.addToCart(activity, session);
//
//      return activity; // 추가한 상품 정보 반환
//    }

    
    //임시
    @RequestMapping(value = "/addTempProductToCart.do", method = RequestMethod.POST)
    public String addTempProductToCart(@RequestParam("act_id") int act_id, HttpSession session) {
        String user_id = (String) session.getAttribute("user_id");
        cartService.addTempProductToCart(user_id, act_id);
        return "redirect:/cartList";
    }
    
    @RequestMapping(value = "/addToCart.do", method = RequestMethod.POST)
    public String addToCart(@RequestParam("act_id") int act_id, HttpSession session) {
        String user_id = (String) session.getAttribute("user_id");
        
        // 데이터베이스에서 활동 정보
        ActivityVO activity = new ActivityVO();
        activity.setId(act_id);
        ActivityVO selectedActivity = activityService.selectOne(activity);
        
        // 장바구니에 추가할 상품 정보를 담은 CartVO 객체를 생성
        CartVO cart = new CartVO();
        cart.setUser_id(user_id);
        cart.setAct_id(selectedActivity.getId());
//        cart.setAct_name(selectedActivity.getAct_name());
        cart.setPrice(selectedActivity.getPrice());
   
        
        // 상품을 장바구니에 추가
        cartService.addToCart(cart);
        
        return "redirect:/cartList";
    }




    
    
}
