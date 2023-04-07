package api13.Exception;

/**
 * @Date : 2023. 3. 31.
 * @Author : 노건호
 * @Desciption : 2종류 이상의 예외처리
 */
public class Ex03 {

	public static void main(String[] args) {
		try {
			String str1 = args[0];
			String str2 = args[1]; // 배열의 갯수가 맞지 않음
			System.out.println(str1 + "\t" + str2);
		} catch (IndexOutOfBoundsException e) {
			System.out.println("배열범위벗어남");
		}
		
		System.out.println("그다음문장들 실행!");
	}

}
