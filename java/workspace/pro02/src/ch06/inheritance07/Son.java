package ch06.inheritance07;

public class Son extends Parents {
	
	public Son(int x, int y) {
		super(x, y);
	}
	@Override
	public void yonsan() {
		System.out.println("cha: " + (x - y));
	}
	
//	public void fun() {}; //Cannot override the final method from Parents 가 뜬다
}
