package ch02.control;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : 실습문제 그 두번째
 * 				 1. 구구단 작성 단 입력받기
 * 				 2. 키워드 y 단어가 입력받으면 다시 반복적으로 구구단 작성
 */
public class Exam26_2 {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		
		char loop;
		do {
			System.out.println("단을 입력하시오");
			int dan=sc.nextInt();
			
			for (int i = 1;i<=9; i++) {
				System.out.println(dan+"*"+i+"="+(dan*i));
			}
			System.out.println("또 할래?(y):");
			String string=sc.next();
			loop=string.charAt(0);
		}while(loop=='y'||loop=='Y');
		sc.close();
			
	}
}
