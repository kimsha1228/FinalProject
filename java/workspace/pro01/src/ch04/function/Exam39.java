package ch04.function;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : 함수
 */
public class Exam39 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);

		System.out.println("KOR: ");
		int kor = sc.nextInt();
		System.out.println("ENG: ");
		int eng = sc.nextInt();
		System.out.println("MAT: ");
		int mat = sc.nextInt();

		int tot = total(kor, eng, mat);
		float avg = average(tot);
		String hakjum=hakjum(avg);
		System.out.println(hakjum);
		sc.close();
	}

	private static String hakjum(float avg) {
		// TODO Auto-generated method stub
		String result = null;

		if (avg >= 90) {
			result = "A학점";
		} else if (avg >= 80) {
			result = "B학점";
		} else if (avg >= 70) {
			result = "C학점";
		} else {
			result = "F학점";
		}
		return result;
	}

	private static float average(int tot) {
		// TODO Auto-generated method stub
		return (float) tot / 3;
	}

	private static int total(int kor, int eng, int mat) {
		// TODO Auto-generated method stub
		return kor + eng + mat;
	}

}
