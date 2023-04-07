package ch05.object;

public class Banana {
	private int su;
	private int num;
	private String str;

	public Banana() {
		this.su = 0;
		this.num = 0;
	}

	public Banana(int su, int num) {
		this.su = su;
		this.num = num;
	}

	public Banana(int su, int num, String str) {
		this.su = su;
		this.num = num;
		this.str = str;
	}
	public void disp() {
		System.out.println(su+"\t"+num+"\t"+str);
	}
}
