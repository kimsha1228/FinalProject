package balgil.com.trip.cart.model;

import java.util.List;

public interface CartDAO {
	
		int insert(CartVO vo);
	    
	    void deleteOneCart(int act_id);
	    
	    void deleteManyCart(List<Integer> act_id);
	    
	    List<CartVO> selectAll(CartVO vo);
	    

	    //임시
	    void addToCart(CartVO cart);	    
	}

