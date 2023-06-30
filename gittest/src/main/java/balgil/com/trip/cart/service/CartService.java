package balgil.com.trip.cart.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.cart.model.CartDAO;
import balgil.com.trip.cart.model.CartVO;

@Service
public class CartService {

    @Autowired
    private CartDAO cartDAO;

    public List<CartVO> selectAllCart(CartVO vo) {
    	return cartDAO.selectAll(vo);
    }
//    public List<CartVO> selectAllCart(CartVO cart, String userId) {
//        return cartDAO.selectAll(cart, userId);
//    }

    public void insertOneCart(CartVO cart) {
        //
    }

    public void insertManyCart(CartVO cart) {
        // 
    }

    public void deleteOneCart(int productNum) {
        // 
    }

    public void deleteManyCart(int[] productNums) {
        // 
    }

    public void insertOneReservation(CartVO cart) {
        //
    }

    public void insertManyReservation(CartVO cart) {
        // 
    }
}
