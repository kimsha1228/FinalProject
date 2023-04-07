package ch07.abstract01;

public class son extends Parents { // x,y,msg(),disp()
	public son(int x, int y) {
		super.x = x;
		super.y = y;
	}

	@Override
	public void disp() {
		System.out.println(x + "\t" + y);
	}

}
