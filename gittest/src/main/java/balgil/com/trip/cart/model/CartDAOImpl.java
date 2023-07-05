package balgil.com.trip.cart.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {
    
    private static final String NAMESPACE = "test.com.cart.model.CartMapper";
    
    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insert(CartVO cart) {
        return sqlSession.insert(NAMESPACE + ".insert", cart);
    }

    @Override
    public int delete(CartVO cart) {
        return sqlSession.delete(NAMESPACE + ".delete", cart);
    }

    @Override
    public List<CartVO> selectAll(CartVO vo) {
        List<CartVO> vos =  sqlSession.selectList("CARTTEST", vo);
        return vos;
    }
//    @Override
//    public List<CartVO> selectAll(CartVO cart, String userId) {
//    	return sqlSession.selectList(NAMESPACE + ".selectAll", userId);
//    }
}
