package ch07.abstract02;

public class Dog extends Animal{

	public Dog() {
		super.kind = "포유류(강아지)";
	}

	@Override
	protected void sound() {
		System.out.println("멍멍");
	}

}
