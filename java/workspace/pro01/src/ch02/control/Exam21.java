package ch02.control;

/**
 * @Date 		: 2023. 3. 22.
 * @Author 		: 노건호
 * @Desciption	: 반복문 - while문과 do~while의 차이점
 */
public class Exam21 {

	public static void main(String[] args) {
		int x=10;
		
		while(x>50) { //조건식이 앞에잇다
			System.out.println("while루프");
		}
		
		do { //조건식이 뒤에잇어서 무적권 한번은 실행된다
			System.out.println("dowhile루프");
		} while (x>50);
	}

}
