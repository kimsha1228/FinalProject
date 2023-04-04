package ch01.dataType;

/**
 * @Date 		: 2023. 3. 20.
 * @Author 		: 노건호
 * @Desciption	: 2. 단항 연산자 : !(일반부정), ~(이진 또는 비트 부정), +/- (출력시 부호 변화)
 * 								   ++/--(증감연산자 / 전위형 증감연산자, 후위형증감연산자)
 */
public class Exam03 {
	public static void main(String[] args) {
		int x=10;
		++x;	//전위형
		x++;	//후위형
		System.out.println(x);
		
		--x;
		x--;
		System.out.println(x);
		
		int i=10;
		int j=20;
		int c=++i + j++; // j++는 후위연산자라서 가장 마지막에 계산된다. 11+20=31
		System.out.println(c);
	}
}
