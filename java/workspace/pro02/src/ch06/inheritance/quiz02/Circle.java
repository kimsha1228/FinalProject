package ch06.inheritance.quiz02;

public class Circle extends Figure {
	private String name = "원";
	private double 반지름;

	public Circle(double d) {
		반지름 = d;
	}

	@Override
	public void area() {
		System.out.println(name + "의 면적:" + (Math.PI * 반지름 * 반지름));
	}

	@Override
	public void around() {
		System.out.println(name + "의 면적:" + (Math.PI * 반지름 * 2));
	}

}
