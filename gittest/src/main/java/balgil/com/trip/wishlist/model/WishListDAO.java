package balgil.com.trip.wishlist.model;

import java.util.List;

public interface WishListDAO {

	int insert(WishListVO vo);

	int delete(WishListVO vo);

	List<WishListVO> selectAll(WishListVO vo);

	WishListVO selectOne(WishListVO vo);
}
