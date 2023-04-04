package ch04.function;

/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : Call by value ~ return
 */
public class Exam38 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int value = apple();
		System.out.println(value);

		int hap = banana(77, 88);
		System.out.println(hap);

		String str = melon();
		System.out.println(str);
	}

	public static String melon() {
		return "hi";
	}
	public static int banana(int a, int b) {
		int hap = a + b;
		return hap;
	}

	public static int apple() {
		int value = 77;
		return value;
	}
}
