package ch06.inheritance08;

public class Student extends Person {
	public void xx() {
	};

	public void yy() {
	};

	public void zz() {
	};

	public void setMessage(String message) {
		super.message = message;
		System.out.println("Student의 메서드");
		System.out.println(super.getMessage());
	}
}
