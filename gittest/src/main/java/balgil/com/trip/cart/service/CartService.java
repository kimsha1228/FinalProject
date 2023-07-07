package balgil.com.trip.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.cart.model.CartDAO;
import balgil.com.trip.cart.model.CartVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartService {

    @Autowired
    CartDAO dao;
    
    public CartService() {
		log.info("CartService()...");
	}

	public int insertOne(CartVO vo) {
		return dao.insertOne(vo);
	}

//	public int delete(CartVO vo) {
//		return dao.delete(vo);
//	}

	public List<CartVO> selectAllCart(CartVO vo) {
		// TODO Auto-generated method stub
		return dao.selectAll(vo);
	}
//
//	public void addToCart(ActivityVO activity, HttpSession session) {
//		    // 장바구니에 상품 추가 로직 작성
//		    dao.addToCart(activity, session);
//	}

	public void deleteOneCart(int act_id) {
		
	        dao.deleteOneCart(act_id);
	}

	public void deleteManyCart(List<Integer> act_id) {
		
	        dao.deleteManyCart(act_id);
	}

	
	//insertOneCart, insertManyCart ,deleteOneCart, deleteManyCart
   
	
	//임시
	 public void addTempProductToCart(String user_id, int act_id) {
	   
	 }
	 
	 //임시
	 public void addToCart(CartVO cart) {
			dao.addToCart(cart);
	    }

	public CartVO selectOne(CartVO vo) {
		return dao.selectOne(vo);
	}

	public int insertCountUp(CartVO vo) {
		return dao.insertCountUp(vo);
	}

	public int updateOneCart(CartVO vo) {
		return dao.updateOneCart(vo);
	}
	 
	 
	 
   
}
