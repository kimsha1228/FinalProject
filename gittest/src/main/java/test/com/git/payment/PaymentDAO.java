package test.com.git.payment;

public interface PaymentDAO {

	int insert(PaymentVO vo);

	PaymentVO selectOne(PaymentVO vo);

}
