package ch05.object;

public class Exam43 {

	public static void main(String[] args) {
		Person kim = new Person();
		kim.name = "김길동";
		kim.age = 27;
		kim.ki = 188.0f;
		kim.disp();
		
		Person park = new Person();
		park.name = "박길동";
		park.age = 25;
		park.ki = 175.4f;
		park.disp();
		
		Person lee = new Person();
		lee.input("이기동",22,170.0f);
		// 클래스의 맴버변수에 데이터를 전달하는 방법
		// 1).연산자를 통해 직접 전달하는방법(거의 안씀)
		// 2)맴버 함수
		// 3)생성자
		
		Person pengsoo = new Person();
		pengsoo.input("펭수", 10, 210.0f);
		pengsoo.disp();
	}
}
