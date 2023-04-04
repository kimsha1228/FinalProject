package ch03.array;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : 배열 그 두번쨰
 */
public class Exam28 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);

		int array[] = new int[5]; // 4*5byte 이며 각각 0으로 초기화된다
		for (int i = 0; i < array.length; i++) {
			System.out.println(i + "번째 수 입력:");
			array[i] = sc.nextInt();
		}

		int sum = 0;
		for (int i = 0; i < array.length; i++) {
			sum+= array[i];
		}
		System.out.println("sum: "+ sum);
		sc.close();
	}

}
