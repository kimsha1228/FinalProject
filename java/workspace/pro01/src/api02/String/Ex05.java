package api02.String;

/**
 * @Date 		: 2023. 3. 29.
 * @Author 		: 노건호
 * @Desciption	: Stringbuffer 함수이것저것
 */
public class Ex05 {
	public static void main(String[] args) {
		StringBuffer a = new StringBuffer("** JAVA");
		System.out.println(a);

		a.insert(3, "GOOD");
		System.out.println("문자열 삽입:" + a);

		a.setCharAt(1, '#');
		System.out.println("문자치환:" + a);

		a.replace(3, 7, "Love"); // 3번지부터 7번지전까지 즉 3~6
		System.out.println("문자열치환:" + a);

		a.delete(7, 11);
		System.out.println("문자열삭제:" + a);

		a.deleteCharAt(1);
		System.out.println("문자삭제:" + a);
		
		a.reverse();
		System.out.println("역순출력:" + a);
	}
}
