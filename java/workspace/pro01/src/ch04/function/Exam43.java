package ch04.function;

/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : 오버로딩
 */
public class Exam43 {

	public static void main(String[] args) {
		int a = 10;
		int b = 20;
		int c = yonsan(a, b);
		System.out.println("정수형 합:" + c);

		float x = 55.5f;
		float y = 66.6f;
		float z = yonsan(x, y);
		System.out.println("실수형 합:" + z);
	}

	public static float yonsan(float x, float y) {
		return x + y;
	}

	public static int yonsan(int a, int b) {
		return a + b;
	}
}
