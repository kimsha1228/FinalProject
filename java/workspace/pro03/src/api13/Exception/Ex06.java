package api13.Exception;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @Date : 2023. 3. 31.
 * @Author : 노건호
 * @Desciption : 두종류이상의 에러를 처리하는법
 */
public class Ex06 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		try {
			System.out.println("x:");
			int x = sc.nextInt();
			
			System.out.println("y:");
			int y = sc.nextInt();

			int div = x / y;

			System.out.println(div);
		} catch (ArithmeticException e) {
			System.out.println("0 나누기는 불가능");
		} catch (InputMismatchException e) {
			System.out.println("숫자만 입력하세요");
		}
		sc.close();
	}
}
