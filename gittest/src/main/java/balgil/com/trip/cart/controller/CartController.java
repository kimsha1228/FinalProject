package balgil.com.trip.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.cart.model.CartVO;
import balgil.com.trip.cart.service.CartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
    
    @Autowired
    private CartService cartService;
    
    
    @ResponseBody
    @RequestMapping("/carttest.do")
    public List<CartVO> selectAllCart(CartVO vo) {
        
    	List<CartVO> cartList = cartService.selectAllCart(vo);
    	log.info("cartlist:{}",cartList);
    	
        return cartList;
    }
    
   /* @RequestMapping("/user/selectAllCart.do")
    public String selectAllCart(@RequestParam("id") String userId, Model model) {
        List<CartVO> cartList = cartService.selectAllCart(userId);
        model.addAttribute("cartList", cartList);

        List<Activity> activityList = cartService.getActivityList();
        model.addAttribute("activityList", activityList);

        return "cart/cartList";
    }



    @RequestMapping("/user/insertOneCart.do")
    public String insertOneCart(CartVO cart, RedirectAttributes redirectAttributes) {
        cartService.insertOneCart(cart);
        redirectAttributes.addFlashAttribute("message", "상품을 장바구니에 추가하였습니다.");
        return "redirect:/user/selectAllCart.do?id=" + cart.getUser_id();
    }f

    @RequestMapping("/user/insertManyCart.do")
    public String insertManyCart(CartVO cart, RedirectAttributes redirectAttributes) {
        cartService.insertManyCart(cart);
        redirectAttributes.addFlashAttribute("message", "상품을 장바구니에 추가하였습니다.");
        return "redirect:/user/selectAllCart.do?id=" + cart.getUser_id();
    }

    @RequestMapping("/user/deleteManyCart.do")
    public String deleteManyCart(@RequestParam("selectedItems") int[] productNums, @RequestParam("id") String userId,
            RedirectAttributes redirectAttributes) {
        cartService.deleteManyCart(productNums);
        redirectAttributes.addFlashAttribute("message", "선택한 상품을 장바구니에서 삭제하였습니다.");
        return "redirect:/user/selectAllCart.do?id=" + userId;
    }


    @RequestMapping("/user/deleteOneCart.do")
    public String deleteOneCart(@RequestParam("num") int productNum, @RequestParam("id") String userId,
            RedirectAttributes redirectAttributes) {
        cartService.deleteOneCart(productNum);
        redirectAttributes.addFlashAttribute("message", "상품을 장바구니에서 삭제하였습니다.");
        return "redirect:/user/selectAllCart.do?id=" + userId;
    }
*/


    

    
}
