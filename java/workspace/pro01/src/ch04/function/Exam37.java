package ch04.function;

import java.util.Scanner;

public class Exam37 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);

		System.out.println("KOR: ");
		int kor = sc.nextInt();
		System.out.println("ENG: ");
		int eng = sc.nextInt();
		System.out.println("MAT: ");
		int mat = sc.nextInt();

		// 총점, 평균 계산하기

		total(kor, eng, mat);
		average(kor, eng, mat);

		sc.close();

	}

	public static void total(int kor, int eng, int mat) {
		System.out.println("총점: " + (kor + eng + mat));
	}

	public static void average(int kor, int eng, int mat) {
		System.out.println("평균: " + ((float)(kor + eng + mat)/3));
	}

}
