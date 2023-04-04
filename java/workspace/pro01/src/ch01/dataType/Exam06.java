package ch01.dataType;

/**
 * @Date : 2023. 3. 21.
 * @Author : 노건호
 * @Desciption : 4. 비교연산자 : <, >, <=, >= , != , ==
 */
public class Exam06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 10;
		int b = 20;

		boolean c = a > b; // 10 > 20
		boolean d = a < b; // 10 < 20
		boolean e = a >= b;// 10 >= 20
		boolean f = a <= b;// 10 <= 20

		System.out.println(c);
		System.out.println(d + "\n");
		System.out.println(e + "\n");
		System.out.println(f + "\n");

		int x = 100;
		int y = 200;
		boolean num = x == y; // 100==200
		boolean value = x != y; // 100!=200
		System.out.println(num);
		System.out.println(value);
	}
}
