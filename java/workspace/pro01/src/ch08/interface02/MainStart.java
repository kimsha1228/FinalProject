package ch08.interface02;

/**
 * @Date 		: 2023. 3. 28.
 * @Author 		: 노건호
 * @Desciption	: 시나리오-A전자에서 다양한 스마트폰을 만듭니다. 모델별 스펙은 다음과같다.
 * 					제품명  4g/3g/lte 카메라화소 리모컨기능
 * 					  A			3g		500만화소	없음
 * 					  B			LTE		800만화소	있음
 * 				      C			4G		1000만화소	있음
 */
public class MainStart {
	public static void main(String[] args) {
		APhone a=new APhone();
		BPhone b=new BPhone();
		CPhone c=new CPhone();
		
		sub(a);
		sub(b);
		sub(c);
	}

	public static void sub(Phone phone) {
		// TODO Auto-generated method stub
		phone.canData();
		phone.tvRemote();
		phone.takeCamera();
		System.out.println();
	}
	
}
