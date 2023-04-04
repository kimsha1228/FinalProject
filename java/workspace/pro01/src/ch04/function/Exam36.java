package ch04.function;

import java.util.Scanner;


/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : 두개의 수와 부호를 입력받아서 연산 (함수로)
 */
public class Exam36 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int su=0,value=0;
		char buho=0;
		do {
			System.out.println("수1:");
			su = sc.nextInt();

			System.out.println("부호:");
			String str = sc.next();
			buho = str.charAt(0);

			System.out.println("수2:");
			value = sc.nextInt();
		}while(buho!='+'&&buho!='*'&&buho!='-'&&buho!='/');

		if (buho == '+') {
			hap(su, value, buho);
		} else if (buho == '-') {
			cha(su, value, buho);
		} else if (buho == '*') {
			mul(su, value, buho);
		} else if (buho == '/') {
			div(su, value, buho);
		}

		sc.close();
	}
	public static void div(int su, int value, char buho) {
		if(value==0) {
			System.out.println("0으로 나눌수 없습니다. 그래서 1로 나누었습니다.");
			value=1;
		}
		System.out.println(su + "" + buho + value + "=" + ((float)su/value));
	}
	public static void mul(int su, int value, char buho) {
		System.out.println(su + "" + buho + value + "=" + (su*value));
	}
	public static void cha(int su, int value, char buho) {
		System.out.println(su + "" + buho + value + "=" + (su-value));
	}
	public static void hap(int su, int value, char buho) {
		System.out.println(su + "" + buho + value + "=" + (su+value));
	}
}
