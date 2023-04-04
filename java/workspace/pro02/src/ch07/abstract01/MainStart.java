package ch07.abstract01;

/**
 * @Date 		: 2023. 3. 28.
 * @Author 		: 노건호
 * @Desciption	: 추상함수
 */
public class MainStart {

	public static void main(String[] args) {
//		Parents p=new Parents();// 추상 클래스는 자기 자신의 객체를 못  만듬
		son son=new son(10,2);
		son.disp();
		
		Parents p= new son(11, 3);
		p.disp();
	}

}
