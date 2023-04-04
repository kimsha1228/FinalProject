package ch02.control;

/**
 * @Date 		: 2023. 3. 21.
 * @Author 		: 노건호
 * @Desciption	:
 */
public class Exam15 {

	public static void main(String[] args) {
		char a='W';
		
		switch (a) {
		case 'W': case 'w':	//if(a=='W' || a=='w'){}
			System.out.println("White");
			break;
		case 'B': case 'b':	//else if(a=='B' || a=='b')
			System.out.println("Blue");
			break;
		default:
			break;
		}
	}

}
