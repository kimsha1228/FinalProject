package ch06.inheritance.quiz02;

public class Main {

	public static void main(String[] args) {
		Figure f=new Rectangular(2.3, 3.7);
		f.area();
		f.around();
		
		Figure i=new Circle(3.6);
		i.area();
		i.around();
	}
}
