package ch05.object;

public class Value {
	private int su;
	private int num;

	public void input(int s, int n) {
		su = s;
		num = n;
	}

	public void disp() {
		System.out.println(su + "\t" + num);
	}
}
