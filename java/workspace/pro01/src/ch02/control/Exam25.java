package ch02.control;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : Scanner
 */
public class Exam25 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.println("수 입력:");
		int su = scanner.nextInt();

		for (int i = 1; i <= su; i++) {
			System.out.println(i);
		}

		System.out.println("이름은?");
		String name = scanner.next();

		System.out.println("국어:");
		int kor = scanner.nextInt();

		System.out.println("영어:");
		int eng = scanner.nextInt();

		System.out.println("수학:");
		int mat = scanner.nextInt();

		int tot = kor + eng + mat;

		System.out.println(name + " " + kor + " " + eng + " " + mat + " " + tot);

		scanner.close();
	}
}
