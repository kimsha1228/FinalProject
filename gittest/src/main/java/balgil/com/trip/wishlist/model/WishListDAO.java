package balgil.com.trip.wishlist.model;

import java.util.List;

public interface WishListDAO {

	int insert(WishListVO vo);

	int update(WishListVO vo);
	
	int delete(WishListVO vo);

	List<WishListVO> selectAll(WishListVO vo);

	List<WishListVO> selectCancel(WishListVO vo);

	WishListVO selectOne(WishListVO vo);
}
