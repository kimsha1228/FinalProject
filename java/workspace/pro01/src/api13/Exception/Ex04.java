package api13.Exception;

/**
 * @Date 		: 2023. 3. 31.
 * @Author 		: 노건호
 * @Desciption	: NULL 포인트 예외
 */
public class Ex04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
		String str=null;
		System.out.println(str.toString());
		}catch (NullPointerException e) {
			System.out.println("String null 발생!");
		}
	}

}
