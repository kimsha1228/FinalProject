package ch05.object.quiz;

public class ABS {
	private int Value;

	public void setValue(int value) {
		Value = value;
	}
	public void resultAbs() {
		Value=(Value<0)?-Value:Value;
	}
	public void disp() {
		System.out.println("result:"+Value);
	}
	
}
