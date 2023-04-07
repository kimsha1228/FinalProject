package api13.Exception;

import java.util.Scanner;

/**
 * @Date 		: 2023. 3. 31.
 * @Author 		: 노건호
 * @Desciption	: getMessage()로 상세메시지
 * 					printStackTrace()로 몇번줄에 에러났는지도 보기
 */
public class Ex11 {

	public static void main(String[] args) {

		try {
			Scanner sc = new Scanner(System.in);
			System.out.println("x");
			int x = sc.nextInt();

			System.out.println("y");
			int y = sc.nextInt();

			int div = x / y;
			System.out.println(div);

			sc.close();
		} catch (Exception e) {
			System.out.println("예외발생햇습니다.");// view단으로바뀐다
			System.out.println(e.getMessage());
			e.printStackTrace(); //개발자가 필요함
		}
	}

}
