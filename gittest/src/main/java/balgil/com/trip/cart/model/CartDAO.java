package balgil.com.trip.cart.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import balgil.com.trip.activity.model.ActivityVO;

public interface CartDAO {
	
		int insert(CartVO vo);
	    
	    void deleteOneCart(int act_id);
	    
	    void deleteManyCart(List<Integer> act_id);
	    
	    List<CartVO> selectAll(CartVO vo);
	    

	    void addToCart(ActivityVO activity, HttpSession session);
	    
	}

