package ch04.function;

/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : 함수중복 - Method Overload(Overloading) 비슷한 기능(함수)의 이름이 동일 대신 자료형과
 *             개수가 달라야함
 * 
 */
public class Exam42 {

	public static void main(String[] args) {
		disp("홍길동");
		disp(10);
		disp(55.5f);
		disp('A');
		disp(10, 20);
	}

	public static void disp(int a, int b) {
		System.out.println(a + "\t" + b);
	}

	public static void disp(String str) {
		System.out.println(str);
	}

	public static void disp(char str) {
		System.out.println(str);
	}

	public static void disp(int str) {
		System.out.println(str);
	}

	public static void disp(Float str) {
		System.out.println(str);
	}
}
