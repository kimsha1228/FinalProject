package ch02.control.quiz2;

import java.util.Scanner;

public class quiz03 {
	public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		System.out.print("1~99 사이의 정수를 입력하세요 >>> ");
		int num=scanner.nextInt();
		int tenth=num/10;
		int oneth=num%10;
		if (tenth==3||tenth==6||tenth==9) {
			if(oneth==3||oneth==6||oneth==9) {
				System.out.println("박수 짝짝");
			}else {
				System.out.println("박수 짝");
			}
		}else if (oneth==3||oneth==6||oneth==9) {
			System.out.println("박수 짝");
		}else {
			System.out.println("박수 없음");
		}
		scanner.close();
	}
}
