package ch01.dataType;

/**
 * @Date : 2023. 3. 21.
 * @Author : 노건호
 * @Desciption : 5. 논리연산자 : 이진 또는 비트(&,|,^) (&&,||)
 */
public class Exam07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		byte a = 10;
		byte b = 2;

		// 10:0000 1010
		// 2 :0000 0010
		// & :0000 0010 둘다 true 여야 true
		// | :0000 1010 하나만 true 이면 true
		// ^ :0000 1000 하나만 true 여야 true

		System.out.println("a & b:" + (a & b));
		System.out.println("a | b:" + (a | b));
		System.out.println("a ^ b:" + (a ^ b));

		int x = 15;
		boolean y = x > 10 && x < 20; // 15>10 true && x<20 true = 둘다 true이면 true
		boolean z = x == 10 || x == 15; // 15==10 false || 15==15 true =둘중 하나만 true이면 true
		System.out.println(y);
		System.out.println(z);
	}

}
