package ch02.control;

/**
 * @Date : 2023. 3. 21.
 * @Author : 노건호
 * @Desciption : if else if
 */
public class Exam11 {

	public static void main(String[] args) {
		int num = 24;
		int value = 24;

		if (num > value) {
			System.out.println("num은 value보다 크댕");
		} else if (num == value) {
			System.out.println("num은 value랑 같댕");
		} else if (num < value) {
			System.out.println("num은 value보다 작댕");
		}

		// 입력
		String name = "홍길동";
		int kor = 70;
		int eng = 80;
		int mat = 90;

		// 연산 : 총점과 평균을 구하고 학점
		int tot = kor + eng + mat;
		float avg = (float) tot / 3;

		char hakjum = 0;

		if (avg >= 90) {
			hakjum = 'A';
		} else if (avg >= 80) {
			hakjum = 'B';
		} else if (avg >= 70) {
			hakjum = 'C';
		} else if (avg >= 60) {
			hakjum = 'D';
		} else if (avg < 60) {
			hakjum = 'F';
		}
		// 출력 : 이름, 평균, 학점
		System.out.println(name + "\t" + avg + "\t" + hakjum);
	}

}
