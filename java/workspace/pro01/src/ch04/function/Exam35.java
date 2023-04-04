package ch04.function;

/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : call by value
 */
public class Exam35 {

	public static void main(String[] args) {
		int x = 10;

		apple(x);// int 값을 넘긴다
		banana(12, 2.2f, 'd', "으으음");
	}

	public static void apple(int x) {
		System.out.println("늙고 지친" + x);
	}

	public static void banana(int su, float value, char ch, String str) {
		System.out.println(su+"ㅇ"+value+ch+str);
	}
}
