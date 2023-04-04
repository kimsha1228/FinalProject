package ch03.array;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : 배열 실습문제 임의의 수를 입력 받아서 최대값,최소값 구하기
 */
public class Exam29 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int[] su = new int[5];
		for (int i = 0; i < su.length; i++) {
			System.out.println(i + "번째 수 입력:");
			su[i] = sc.nextInt();
		}

		// 가장 큰값 구하기
		int max = su[0];
		for (int i = 0; i < su.length; i++) {
			max = (max < su[i]) ? su[i] : max;
		}
		System.out.println("최대값은:" + max);
		
		// 가장 작은값 구하기
		int min = su[0];
		for (int i = 0; i < su.length; i++) {
			min = (min > su[i]) ? su[i] : min;
		}
		System.out.println("최소값은:" + min);
		sc.close();
	}
}
