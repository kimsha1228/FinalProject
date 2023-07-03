package balgil.com.trip.cart.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.cart.model.CartDAO;
import balgil.com.trip.cart.model.CartVO;
import balgil.com.trip.reservation.model.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartService {

    @Autowired
    CartDAO dao;
    
    public CartService() {
		log.info("CartService()...");
	}

	public int insert(CartVO vo) {
		return dao.insert(vo);
	}

	public int delete(CartVO vo) {
		return dao.delete(vo);
	}

	public List<CartVO> selectAllCart(CartVO vo) {
		// TODO Auto-generated method stub
		return dao.selectAll(vo);
	}

	
	//insertOneCart, insertManyCart ,deleteOneCart, deleteManyCart
   
   
}
