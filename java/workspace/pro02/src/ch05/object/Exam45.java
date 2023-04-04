package ch05.object;
	
/**
 * @Date 		: 2023. 3. 24.
 * @Author 		: 노건호
 * @Desciption	: 접근제한자 자료형 맴버변수명
 */
public class Exam45 {

	public static void main(String[] args) {
		Value a=new Value();
		a.input(1,2);
		
		Value b=new Value();
		//b.su=7;//private 걸려잇어서 불가
		b.input(7, 88);
	}

}
