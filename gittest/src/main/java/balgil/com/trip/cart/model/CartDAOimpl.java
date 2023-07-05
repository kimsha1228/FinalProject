package balgil.com.trip.cart.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import balgil.com.trip.activity.model.ActivityVO;
import balgil.com.trip.reservation.model.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CartDAOimpl implements CartDAO {
    
    
    @Autowired
    SqlSession sqlSession;

    public CartDAOimpl() {
    	log.info("CartDAOimpl()...");
    }
    
    @Override
	public int insert(CartVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("CART_INSERT", vo);
	}


    @Override
    public List<CartVO> selectAll(CartVO vo) {
        log.info("selectAll()...{}", vo);

        List<CartVO> vos = sqlSession.selectList("CARTTEST", vo);
        return vos;
    }

    //임시
    @Override
    public void addToCart(CartVO cart) {
        sqlSession.insert("sqlMapper_cart", cart);
    }

	
	@Override
	public void deleteOneCart(int act_id) {
	    sqlSession.delete("CART_DELETE_ONE", act_id);
	}

	@Override
	public void deleteManyCart(List<Integer> act_id) {
	    sqlSession.delete("CART_DELETE_MANY", act_id);
	}
}