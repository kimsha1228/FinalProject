package ch02.control;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : 제어문 - 반복문(for, 다중 for, while) 여기는 do~while
 */
public class Exam20 {
	public static void main(String[] args) {
		int x = 1; // 초기값
		do {
			System.out.println(x);
			x++; // 증감값
		} while (x <= 10); // 조건식

		int sum = 0;
		int cnt = 1;

		do {
			sum += cnt;
			cnt++;
		} while (cnt <= 100);
		System.out.println(sum);
	}
}
