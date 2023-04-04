package ch02.control;
/**
 * @Date : 2023. 3. 21.
 * @Author : 노건호
 * @Desciption : if~else
 */
public class Exam10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = -25;

		if (a > 0) {
			System.out.println("양수당");
		} else {
			System.out.println("음수당");
		}
		System.out.println(a > 0 ? "양수당" : "음수당");

		if (a % 2 == 0) {
			a += 100;
			System.out.println(a + "는 짝수입니다");
		} else {
			a *= 200;
			System.out.println(a + "는 홀수입니다");
		}

		int score = 50;
		if (score >= 50) { // 50 >=50
			System.out.println(score + "점은 합격이댕");
		} else {
			System.out.println(score + "점은 불합격이댕");
		}
	}

}
