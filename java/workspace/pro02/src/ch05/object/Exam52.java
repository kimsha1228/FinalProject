package ch05.object;
	
/**
 * @Date 		: 2023. 3. 27.
 * @Author 		: 노건호
 * @Desciption	: static 변수:프로그램이 시작될떄 만들어지고 종료되면 사라진다(메모리공간)
 */
public class Exam52 {

	public static void main(String[] args) {
		AA aa=new AA();
		aa.input(10, 20);
		
		aa.x=70; //얘는 aa객체에만 귀속되어있는 맴버변수
		AA.y=70; //얘는 프로그램 시작할때부터 선언되어있는 static변수. 클래스명으로 접근
		
		System.out.println(aa.PI);
		System.out.println(AA.V);
	}

}
