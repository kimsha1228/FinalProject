package balgil.com.trip.cart.model;

import java.util.List;

public interface CartDAO {
	
    int insert(CartVO vo);
    
    int delete(CartVO vo);
    
    List<CartVO> selectAll(CartVO vo);
}
