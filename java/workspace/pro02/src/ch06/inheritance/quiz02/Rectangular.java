package ch06.inheritance.quiz02;

public class Rectangular extends Figure{
	private String name="사각형";
	private double 가로,세로;
	
	public Rectangular(double d, double e) {
		super();
		this.가로 = d;
		this.세로 = e;
	}

	@Override
	public void area() {
		System.out.println(name+"의 면적:"+(가로*세로));
	}

	@Override
	public void around() {
		System.out.println(name+"의 둘레:"+(가로*2+세로*2));
		
	}

}
