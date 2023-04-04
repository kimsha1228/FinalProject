package ch02.control;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : 자바 입출력:기본입출력(화면, 키보드), 
 * 								파일입출력,네트워크 입출력 키보드 입력
 */
public class Exam24 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		System.out.println("입력하시오: ");
		String a=sc.next(); //문자열로 받아온다
		
		System.out.println("숫자 입력:");
		int b=sc.nextInt(); //문자열로 넘어온애를 int로 바꿔주는 역할
		
		System.out.println("바이트 입력:");
		byte c=sc.nextByte(); //문자열로 넘어온애를 byte로 바꿔주는 역할
		
		System.out.println("float 입력:");
		float d=sc.nextFloat(); //문자열로 넘어온애를 float로 바꿔주는 역할
		
		System.out.println("문자 입력:");
		String e=sc.next(); //문자열로 받아온다
		char ch=e.charAt(0);//String, StringBufer Class
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
		System.out.println(ch);
		sc.close();
	}
}