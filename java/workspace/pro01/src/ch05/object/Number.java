package ch05.object;

public class Number {
	private int x; //private라서 디버깅창엔 빨갛게 뜬다
	private int y;

	public void input(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println(x + "\t" + y);
	}

	public void disp() {
		int x = 24; // 내거에서 찾아보고 있으면 내것이 최우선
					// 그래서 private x를 쓰고 싶으면 this.x를 붙이던가 해야되는것
		System.out.println(this.x + "\t" + x + "\t" + y);
	}
}
