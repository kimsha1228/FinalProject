package ch05.object;

/**
 * @Date 		: 2023. 3. 27.
 * @Author 		: 노건호
 * @Desciption	: static과 final 연습
 */
public class Exam53 {

	public static void main(String[] args) {
		System.out.println("현재이율:" + Bank.TODAYIYUL);
		Bank hong = new Bank("홍길동", 1000, 0.5f);
		hong.disp();

		Bank lee = new Bank("이길동", 2000, 0.7f);
		lee.disp();
		hong.disp(); // lee를 선언할때iyul이 바뀌었기떄문에 홍길동것도 바뀜

		Bank park = new Bank("박길동", 4000, 0.8f);
		park.disp();
		hong.disp();// park를 선언할때iyul이 바뀌었기떄문에 홍길동것도 바뀜
		lee.disp();// park를 선언할때iyul이 바뀌었기떄문에 이길동것도 바뀜
		
		BB b=new BB();
		b.apple();
		BB.sub();
		
		System.out.println("=========================");
		
		int su=Integer.MIN_VALUE;
		System.out.println(su);
		int su1=Integer.BYTES;
		System.out.println(su1);
		
		String x=String.valueOf(false);
		System.out.println(x);
	}
}
