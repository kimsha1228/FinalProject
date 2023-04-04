package api13.Exception;

/**
 * @Date 		: 2023. 3. 31.
 * @Author 		: 노건호
 * @Desciption	: 예외는 예외발생~처리 try ~catch~finally
 * 						예외만들기
 * 						예외전가
 * 
 * 		예) 123456-789123라는 계좌번호를 받았다 치자
 * 			근데 중간에 -를 빼면 다 숫자이기떄문에 처리하기 편해질것 같다
 * 			근데 이걸 JDK에서 오류라고 인식을 안하기 때문에
 * 			강제로 예외를 발생시켜보자
 */

import java.util.Scanner;

class MyException extends NumberFormatException {
	private static final long serialVersionUID = 1L;

	public MyException() {
		super();
	}

	public MyException(String str) {
		super(str);
	}

}

public class Ex09 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		//내 프로그램로직상 5는 들어오면 안되면?
		try {
			System.out.println("수:");
			int su = sc.nextInt();
			if (su == 5) {
				// 예외 클래스 만들기
				MyException my = new MyException("5는 안되");
				throw my;
			}

			System.out.println(su);
		} catch (Exception e) {
			System.out.println("5는 안되요..");
		} finally {
			if (sc != null)
				sc.close();
		}
	}
}
