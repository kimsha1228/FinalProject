package ch07.abstract03;

public class SuperRobot extends Robot {
	public SuperRobot(String kind) {
		super.kind = kind;
	}

	@Override
	public void actionFly() {
		System.out.println("Super하게 난다!");
	}

	@Override
	public void actionMissile() {
		System.out.println("SUPER 미사일 발사!");

	}

	@Override
	public void actionKnife() {
		System.out.println("레이저검 발도!!");
	}
}
