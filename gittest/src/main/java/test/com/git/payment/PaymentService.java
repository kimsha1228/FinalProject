package test.com.git.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PaymentService {

	@Autowired
	PaymentDAO dao;

	public PaymentService() {
		log.info("PaymentService()...");
	}

	public int insert(PaymentVO vo) {
		return dao.insert(vo);
	}

	public PaymentVO selectOne(PaymentVO vo) {
		return dao.selectOne(vo);
	}

}
