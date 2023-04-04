package ch01.dataType;

/**
 * @Date 		: 2023. 3. 20.
 * @Author 		: 노건호
 * @Desciption	: 연산자 우선순위
 * 				  	1. 최우선 연산자:. [] ()
 * 					2. 단항 연산자	: !(일반부정),~(비트부정) , +/-( 출력시 부호변화)
 */

public class Exam02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean a=false; // a = false
		boolean b=!a;	 // b= a의 반대 즉 true
		System.out.println(a);
		System.out.println(b);
		
		int x=100;
		int y=-200;
		System.out.println(x + "\t"+y);
		System.out.println(-x + "\t"+-y); // 부호가 변함
		System.out.println(x + "\t"+y); //원본 데이터엔 영향이 없다
	}

}
