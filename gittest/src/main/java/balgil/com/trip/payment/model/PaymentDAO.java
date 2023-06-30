package balgil.com.trip.payment.model;

public interface PaymentDAO {

	int insert(PaymentVO vo);

	PaymentVO selectOne(PaymentVO vo);

}
