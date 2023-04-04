package ch07.abstract02;

public abstract class Animal {
	protected String kind;
	
	public void breath() {
		System.out.println("숨을 쉽니다");
	}
	
	protected abstract void sound();
}
