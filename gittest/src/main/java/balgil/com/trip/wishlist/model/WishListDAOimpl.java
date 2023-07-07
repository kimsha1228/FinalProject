package balgil.com.trip.wishlist.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class WishListDAOimpl implements WishListDAO {

	@Autowired
	SqlSession sqlSession;

	public WishListDAOimpl() {
		log.info("WishListDAOimpl()...");
	}

	@Override
	public int insert(WishListVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("WISHLIST_INSERT", vo);
	}

//	@Override
//	public int update(WishListVO vo) {
//		log.info("update()...{}", vo);
//
//		return sqlSession.update("WISHLIST_UPDATE", vo);
//	}

	@Override
	public int delete(WishListVO vo) {
		log.info("delete()...{}", vo);

		return sqlSession.delete("WISHLIST_DELETE", vo);
	}

	@Override
	public List<WishListVO> selectAll(WishListVO vo) {
		log.info("selectAll()...{}", vo);

		return sqlSession.selectList("WISHLIST_SELECT_ALL_WITH_USER_ID", vo);
	}

	@Override
	public WishListVO selectOne(WishListVO vo) {
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("WISHLIST_SELECT_ONE", vo);
	}
}
