package ch02.control;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : 실습문제
 * @Desciption : 1. 두수를 입력받는다.
 * @Desciption : 2. 부호입력을 받는다.
 * @Desciption : 3. 부호로 연산한댕.
 * 
 */
public class Exam26_1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);

		char buho = 0;
		do {
			System.out.println("수1:");
			int su1 = sc.nextInt();

			System.out.println("수2:");
			int su2 = sc.nextInt();

			System.out.println("부호:");
			String strB = sc.next();
			buho = strB.charAt(0);

			System.out.println("입력받은값: " + su1 + " " + su2 + " " + buho);

			float result = 0;
			if (buho == '+') {
				result = su1 + su2;
			} else if (buho == '-') {
				result = su1 - su2;
			} else if (buho == '*') {
				result = su1 * su2;
			} else if (buho == '/') {
				result = (float) su1 / su2;
			} else {
				System.out.println("기호를 잘못 입력하셨습니댕");
			}

			if (buho == '/') {
				System.out.println(su1 + "" + buho + "" + su2 + "=" + result);
			} else if (buho == '+' || buho == '-' || buho == '*') {
				System.out.println(su1 + "" + buho + "" + su2 + "=" + (int) result);
			}
		} while (buho != '+' && buho != '-' && buho != '/' && buho != '*');
		sc.close();
	}

}
