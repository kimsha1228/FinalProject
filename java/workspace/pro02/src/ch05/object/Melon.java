package ch05.object;

public class Melon {
//	private int count; // 처음 생성할땐 0, 이렇게 놔두면 cnt가 따로논다
	private static int count; // 처음 생성할땐 0, static 변수는 같은 클래스를 가진 객체끼리 공유함
	private static int hap;

	public Melon() {
		++count; // 그것을 ++해줌
	}

	public void disp() {
		System.out.println(count);
		System.out.println(hap+"\n");
	}

	public void yonsan(int su) {
		hap += su;
	}
}
