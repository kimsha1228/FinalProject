package balgil.com.trip.wishlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.wishlist.model.WishListDAO;
import balgil.com.trip.wishlist.model.WishListVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WishListService {

	@Autowired
	WishListDAO dao;

	public WishListService() {
		log.info("WishListService()...");
	}

	public int insert(WishListVO vo) {
		return dao.insert(vo);
	}

	public int update(WishListVO vo) {
		return dao.update(vo);
	}

	public List<WishListVO> selectAll(WishListVO vo) {
		return dao.selectAll(vo);
	}

	public List<WishListVO> selectCancel(WishListVO vo) {
		return dao.selectCancel(vo);
	}

	public WishListVO selectOne(WishListVO vo) {
		return dao.selectOne(vo);
	}
}
