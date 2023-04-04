package ch01.dataType;

/*
 * 	0Ooㅇ (각각 숫자 영, 영문 대문자 오, 영문 소문자 오, 한글 이응)
	1lI|!ㅣ (각각 숫자 일, 영문 소문자 엘, 영문 대문자 아이, 수직 바,[17] 느낌표, 한글 이)
	2Zz (각각 숫자 이, 영문 대문자 제트, 영문 소문자 제트)
	5Ss (각각 숫자 오, 영문 대문자 에스, 영문 소문자 에스)
	6b (각각 숫자 육, 영문 소문자 비)
	8B (각각 숫자 팔, 영문 대문자 비)
	9gq (각각 숫자 구, 영문 소문자 쥐, 영문 소문자 큐)
	ij (각각 영문 소문자 아이, 영문 소문자 제이)
	Vv, Ww, ... (영문 대문자와 소문자의 모양이 같은 경우)
	__ (연속된 밑줄 문자의 갯수가 파악되는가)
 */
public class Exam01 {
	
	public static void main(String[] args) {
		
		System.out.println("정수형(기본) 자료형");


		byte a = 10; 	// byte(1byte) -128~127까지이다
		short b=128; 	// short(2byte) (-32768~32767)한글변수명도 가능은 하지만 비추천
		int c = 1000; 	// int(4byte) (-2147483648~2147483647)
		long d=6581l;	// long(8byte) (-2^63~2^63-1)
		System.out.println(a+" "+b+" "+c+" "+d);
		
		System.out.println("실수형 자료형");
		
		float e = 45.5f; 	// 4byte (1.4E-45 ~3.4082E38)
		double f= 120.40; 	// 8byte (4.92E-324~1.8E308)
		System.out.println(e+" "+f);
		
		System.out.println("문자형 자료형");
		
		char x='A'; // 2Byte
		char y='김';
		System.out.println("x:"+x);
		System.out.println("y:"+y);

		System.out.println("문자열(객체) 자료형");
		
		String str1="Hello Java!!";
		String str2="안녕하세요!!";

		System.out.println(str1+"\n"+str2);
		
		System.out.println("논리형");
		
		boolean b1=true;
		boolean b2=false;
		
		System.out.println(b1);
		System.out.println(b2);
	}
}

