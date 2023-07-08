package balgil.com.trip.cart.model;

import java.util.List;

public interface CartDAO {
	
		int insertOne(CartVO vo);
	    
		int deleteOneCart(CartVO vo);
	    
		public void deleteManyCart(List<Integer> act_id);
	    
		public List<CartVO> selectAll(CartVO vo);
	    

	    //임시
		public void addToCart(CartVO cart);

		CartVO selectOne(CartVO vo);

		int insertCountUp(CartVO vo);

		int updateOneCart(CartVO vo);	    
	}

