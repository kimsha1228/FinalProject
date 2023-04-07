package ch06.inheritance06;

/**
 * @Date 		: 2023. 3. 27.
 * @Author 		: 노건호
 * @Desciption	: 함수 재정의(오버라이딩):상속에만 잇는개념
 */
public class MainStart {

	public static void main(String[] args) {
		Son son= new Son();
		son.disp(); //자식의 오버라이딩된 disp 호출
		
		Parents p = new Parents();
		p.aa();
		p.dd();
		p.disp();//부모의 disp 호출
//		p.xx(); //자식거
	}

}
