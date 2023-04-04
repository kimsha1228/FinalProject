package ch02.control;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : break, continue
 */
public class Exam22 {
	public static void main(String[] args) {
		for (int i = 1; i <= 10; i++) {
			if (i == 5) {
				break; // DB 인덱싱관련
//						만약 조건을 만족하면 뒤에것은 실행할 필요가 없으므로 탈출
			}
			System.out.println(i);
		}
		
		System.out.println();

		for (int i = 1; i <= 10; i++) {
			if (i == 7) { //만약 7이면
				continue; //이 루프만 건너뛰는 효과가 잇댕
			}
			System.out.println(i);

		}
	}
}
