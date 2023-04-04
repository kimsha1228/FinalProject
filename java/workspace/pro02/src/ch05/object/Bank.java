package ch05.object;

public class Bank {
	private String name;
	private int don;

	public static float iyul;
	public static final float TODAYIYUL = 0.7f;

	public Bank(String name, int don, float iyul) {
		this.name = name;
		this.don = don;
		Bank.iyul = iyul;
	}

	public void disp() {
		System.out.println(this.name + "\t" + name);
		System.out.println(this.don + "\t" + don);
		System.out.println(Bank.iyul + "\t" + iyul + "\n");
	}
}
