package ch02.control;

/**
 * @Date : 2023. 3. 21.
 * @Author : 노건호
 * @Desciption : 제어문 - 조건문,반복문. 조건문(if, if~else, if~else if, switch~case)
 *             반복문(for, while, do ~ while)
 * 
 */
public class Exam09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x = 20;
		if (x > 10) {
			System.out.println("10보다 큰수입니다.");
		}
		System.out.println("후후후");

		int y = 50;
		if (y > 0 && y < 100) { //50>0 50<100
			y += 200;
			System.out.println(y);
		}
		System.out.println("날씨가좋네");
	}

}
