package api13.Exception;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 31.
 * @Author : 노건호
 * @Desciption : 예외처리, 예외발생, 예외전가 
 * 예외처리-try~catch~finally (시도,오류가 발생하면,항상 실행)
 */
public class Ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);

		System.out.println("수:");
		int su = sc.nextInt(); // 여기서 문자를 입력하면??

		System.out.println("수:");
		int value = sc.nextInt(); // 여기서 문자를 입력하면??

//		10/0 하면
//		Exception in thread "main" java.lang.ArithmeticException: / by zero
//		at api13.Exception.Ex01.main(Ex01.java:23)
//		가 뜬다 
		
		//그래서 try catch를 쓴다
		try {
			float result = su / value;
			System.out.println(result);
		} catch (ArithmeticException e) {
			System.out.println("0으로 나눌수 없습니다.");
		}

		sc.close();
	}

}
