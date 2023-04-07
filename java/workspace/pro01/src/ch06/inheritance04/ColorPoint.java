package ch06.inheritance04;

public class ColorPoint extends Point {
	private String color;

	public ColorPoint() {
		super();
		color = "red";
	}

	public ColorPoint(int x, int y, String color) {
		super(x, y);
		this.color = color;
	}

	public void showColorPoint() {
		showPoint();
		System.out.println(color);
	}
}