package ch06.inheritance04;

public class Point {
	protected int x;
	protected int y;

	public Point() {
		this.x = 10;
		this.y = 20;
	}

	public Point(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}

	public void showPoint() {
		System.out.println(x + "\t" + y);
	}

}
