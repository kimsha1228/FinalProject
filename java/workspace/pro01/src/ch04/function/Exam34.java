package ch04.function;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : 함수 선택
 */
public class Exam34 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		// 게시판

		System.out.println("정수(1~4) 입력:");
		int x = scanner.nextInt();
		if (x == 1) {
			// 작성
			create();
		} else if (x == 2) {
			// 읽기
			read();
		} else if (x == 3) {
			// 내용변경
			update();
		} else if (x == 4) {
			// 삭제
			delete();
		}
		scanner.close();
	}

	public static void create() {
		System.out.println("게시판 작성");
	}

	public static void read() {
		System.out.println("게시판 읽기");
	}

	public static void update() {
		System.out.println("게시판 수정");
	}

	public static void delete() {
		System.out.println("게시판 삭제");
	}
}
