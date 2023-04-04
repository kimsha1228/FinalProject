package ch02.control;

/**
 * @Date : 2023. 3. 21.
 * @Author : 노건호
 * @Desciption : switch case 연습
 */
public class Exam14 {

	public static void main(String[] args) {
		int su = 4;
		
		switch(su) { //boolean과 float는 에러를 뿜는다
		case 1:		//변수나 float는 에러를 뿜는다
			System.out.println("1번케이스");
			break; //탈출용
		case 2:
			System.out.println("2번케이스");
			break;
		case 3:
			System.out.println("3번케이스");
			break;
		case 4:
			System.out.println("4번케이스");
			break;
		case 5:
			System.out.println("5번케이스");
			break;
		case 6:
			System.out.println("6번케이스");
			break;
		}
	}

}
