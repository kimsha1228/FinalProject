package api04.Math;

/**
 * @Date : 2023. 3. 29.
 * @Author : 노건호
 * @Desciption : Math 클래스 - round(),ceil(),floor()
 */
public class Ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double x = 123.5567;
		double y = 456.4672;

		int a = (int) Math.round(x);// 반환형이 long이라 int로 캐스팅한다
		System.out.println("반올림:" + a);

		int b = (int) Math.ceil(y);
		System.out.println("무조건올림:" + b);

		int c = (int) Math.floor(x);
		System.out.println("무조건내림:" + c);

	}

}
