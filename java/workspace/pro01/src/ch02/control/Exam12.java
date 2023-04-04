package ch02.control;

/**
 * @Date 		: 2023. 3. 21.
 * @Author 		: 노건호
 * @Desciption	: 중첩if문
 */
public class Exam12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num=201;
		if(num>0) {
			System.out.println("양수");
			if(num>=200) {
				System.out.println("200보다 크거나 같음");
			}else {
				System.out.println("200보다 작음");
			}
		}else{
			System.out.println("음수");
		}
	}

}
