package ch02.contorl.quiz;

public class quiz01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a=10;
		int b=20;
		int c = ++a + ++b;
		int d = a++ + b++;
		int e = ++a + b++;
		int f = a-- + --b;
		System.out.println("a:" + a);
		System.out.println("b:" + b);
		System.out.println("c:" + c);
		System.out.println("d:" + d);
		System.out.println("e:" + e);
		System.out.println("f:" + f);
		byte byteValue=10; 
		char charValue=65;
		int intValue=byteValue;
		int intValue1=charValue;
		System.out.println(charValue);
		System.out.println(intValue1);
//		short shortValue=charValue;
		double doubleValu=byteValue;
		
		int x=2, y=10, z=0;
		z=x++*2+x*(y%2);
		System.out.println(z);
		System.out.println(++y);
		
		short su=10;
		byte value=(byte) su;
		System.out.println(value);
		
		int score=85; 
		String result=(!(score>90)) ? "가":"나"; 
		System.out.println(result); 
		
		int x1=100; 
		int y1=5; 
		System.out.println((x1>7) && (y1<=5));
		System.out.println((x1%3==2) || (y1%2 !=1));
	}

}
