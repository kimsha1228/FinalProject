package ch04.function;

/**
 * @Date 		: 2023. 3. 23.
 * @Author 		: 노건호
 * @Desciption	: 함수.. 함수는 재활용 가능성이 높다
 */
public class Exam32 {

	public static void main(String[] args) {
//	접근제한자 지정예약어 반환형 함수명(매개변수){실행문}
		sub();
		System.out.println("흐흐흐");
		sub();
		System.out.println("호호호");
		System.out.println("오와리다");
	}

	public static void sub() {
		System.out.println("곤니찌와");
	}
}
