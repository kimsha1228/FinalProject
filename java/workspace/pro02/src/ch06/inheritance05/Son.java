package ch06.inheritance05;

public class Son extends Parents {
	private int a;
	private static int b;

	public void input(int su, int num, int a, int b) {
		super.su = su;
		Parents.num = num;// static이라 클래스명으로 접근
		this.a = a;
		Son.b = b; //static이라 클래스명으로 접근
	}
}
