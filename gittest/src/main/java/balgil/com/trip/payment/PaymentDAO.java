package balgil.com.trip.payment;

public interface PaymentDAO {

	int insert(PaymentVO vo);

	PaymentVO selectOne(PaymentVO vo);

}
