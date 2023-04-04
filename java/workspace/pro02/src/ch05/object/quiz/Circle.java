package ch05.object.quiz;

public class Circle {
	private double Radius;
	private double area;
	public void getRadius(double Radius) {
		this.Radius=Radius;
	}
	public void findArea() {
		this.area=(Math.PI*Radius*Radius);
	}
	public void disp() {
		System.out.println("원의 면적:"+area);
	}
}
