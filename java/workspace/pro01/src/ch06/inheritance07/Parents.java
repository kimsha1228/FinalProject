package ch06.inheritance07;

public class Parents {
	protected int x;
	protected int y;

	public Parents(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public void yonsan() {
		System.out.println("hap: " + (x + y));
	}
	
	public final void fun() {};
}
