package ch01.dataType;

/**
 * @Date : 2023. 3. 21.
 * @Author : 노건호
 * @Desciption : 6. 삼항 연산자 : 조건식 ? 참 : 거짓 /if와 비슷한 효과 7. 대입 연산자 : =, *=, +=, -=
 *             등등 8. 순차 연산자 : ,
 */
public class Exam08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 10;
		System.out.println(a == 10 ? "참" : "거짓");

		int b = 20;
		int c = 30;
		int d = b != c ? b : c; // 20!=30
		System.out.println(d);

		// 대입연산자
		int i = 100;
		System.out.println(i += 2);// i=i+2 102
		System.out.println(i -= 2);// i=i-2 100
		System.out.println(i *= 2);// i=i*2 200
		System.out.println(i /= 2);// i=i/2 100

		// 순차연산자(,)
		int x = 10, y = 20, z = 30;
		System.out.println(x + "\t" + y + "\t" + z);
		System.out.println("=========================\n"); // 입력데이터 문자열, 출력데이터 문자열
		int su = 10;
		int value = 20;
		System.out.println(su + "\t" + value); // su(숫자)+문자열=문자열+value(숫자)=문자열
		System.out.println(su+value); //su(숫자)+value(숫자)=숫자
		//만약 숫자가 아니라 문자열 1020을 출력하고 싶다면
		System.out.println(su+""+value); //su(숫자)+공백(문자열)+value(숫자)=문자열
		System.out.println(su+""+value+(su+value)); //su(숫자)+공백(문자열)+value(숫자)+(숫자+숫자)=문자열

	}

}
