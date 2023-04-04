package ch07.abstract03;

public class StandardRobot extends Robot {
	public StandardRobot(String kind) {
		super.kind = kind;
	}

	@Override
	public void actionFly() {
		System.out.println("Standard라 날수없습니다");
	}

	@Override
	public void actionMissile() {
		System.out.println("Standard 미사일 발사!");

	}

	@Override
	public void actionKnife() {
		System.out.println("목검 발도!!");
	}

}
