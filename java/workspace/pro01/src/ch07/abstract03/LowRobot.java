package ch07.abstract03;

public class LowRobot extends Robot {
	public LowRobot(String kind) {
		super.kind = kind;
	}

	@Override
	public void actionFly() {
		System.out.println("Low는 못 날아");
	}

	@Override
	public void actionMissile() {
		System.out.println("Low는 미사일도없어");

	}

	@Override
	public void actionKnife() {
		System.out.println("Low는 검조차 없어");
	}
}
