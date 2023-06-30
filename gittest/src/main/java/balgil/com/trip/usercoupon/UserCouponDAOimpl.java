package balgil.com.trip.usercoupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UserCouponDAOimpl implements UserCouponDAO {

	@Autowired
	SqlSession sqlSession;

	public UserCouponDAOimpl() {
		log.info("UserCouponDAOimpl()...");
	}

	@Override
	public List<UserCouponVO> selectAll(UserCouponVO vo) {
		log.info("selectOne()...{}", vo);
		
		List<UserCouponVO> vos = sqlSession.selectList("USERCOUPON_SELECTALL", vo);

		return vos;
	}


}
