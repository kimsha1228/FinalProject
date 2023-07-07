package balgil.com.trip.cart.model;

import java.util.List;

public interface CartDAO {
	
		int insertOne(CartVO vo);
	    
		public void deleteOneCart(int act_id);
	    
		public void deleteManyCart(List<Integer> act_id);
	    
		public List<CartVO> selectAll(CartVO vo);
	    

	    //임시
		public void addToCart(CartVO cart);	    
	}

