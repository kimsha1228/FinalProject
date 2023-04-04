package ch07.abstract02;

public class Cat extends Animal {

	public Cat() {
		super.kind = "포유류(고양이)";
	}

	@Override
	protected void sound() {
		System.out.println("냥냥");
	}

}
