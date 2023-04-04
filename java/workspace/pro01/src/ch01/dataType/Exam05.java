package ch01.dataType;

/**
 * @Date 		: 2023. 3. 20.
 * @Author 		: 노건호
 * @Desciption	: 3.산술연산자 : *, /, %, +, -
 * 
 */
public class Exam05 {
	public static void main(String[] args) {
		int x=10;
		int y=20;
		int sum=x+y;
		int cha=x-y;
		int mul=x*y;
		float div=(float)x/y;
		int rest=x%3;
		
		System.out.println("합:"+sum);
		System.out.println("차:"+cha);
		System.out.println("곱:"+mul);
		System.out.println("나누기:"+div);
		System.out.println("나머지:"+rest);
	}
}
