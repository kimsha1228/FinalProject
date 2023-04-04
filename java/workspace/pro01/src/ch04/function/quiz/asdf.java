package ch04.function.quiz;

public class asdf {

	public static void main(String[] args) {
		SnowTire snowTire = new SnowTire();
	//	Tire tire = snowTire;
		Tire tire = new Tire();
		snowTire.run();
		tire.run();
		tire = (Tire)snowTire;
		tire.run();
	}
}

class Tire {
	public void run() {
		System.out.println("일반 타이어가 굴러갑니다.");
	}
}

class SnowTire extends Tire {
	public void run() {
		System.out.println("스노우 타이어가 굴러갑니다.");
	}
}