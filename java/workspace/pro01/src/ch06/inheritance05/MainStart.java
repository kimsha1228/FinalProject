package ch06.inheritance05;

/**
 * @Date 		: 2023. 3. 27.
 * @Author 		: 노건호
 * @Desciption	: 상속과 static
 */
public class MainStart {

	public static void main(String[] args) {
		Son son=new Son();
		son.input(1, 2, 3, 4);
		son.apple();
		Parents.banana(); //static함수는 클래스명으로 접근
		Son.banana();
		
		
	}
}
