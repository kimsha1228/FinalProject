package ch06.inheritance.quiz02;

public class Son extends Parents {
	private int z;

	public Son(int x, int y, int z) {
		super(x, y);
		this.z = z;
	}

	public void disp() {
		System.out.println(x + "," + y + "," + z);
	}
}
