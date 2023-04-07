package ch07.abstract03;

public abstract class Robot {
	protected String kind;

	public void shape() {
		System.out.println(kind + "는 팔, 다리, 몸통, 머리가 잇습니다");
	}

	public void actionWalk() {
		System.out.println("걸을수잇습니다");
	}

	public void actionRun() {
		System.out.println("달릴수잇습니다");
	}

	public abstract void actionFly();

	public abstract void actionMissile();

	public abstract void actionKnife();
}
