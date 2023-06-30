package balgil.com.trip.cart.model;

import java.util.List;

public interface CartDAO {
    int insert(CartVO cart);
    int delete(CartVO cart);
//    List<CartVO> selectAll(CartVO cart, String userId);
    List<CartVO> selectAll(CartVO vo);
}
