package ch07.abstract01;

public abstract class Parents { //30개의 클래스에서 상속을 받는데... disp를 다 재정의해야한다는데..
								//근데 의무적 오버라이딩을 명시안해놓으면 까먹을수도잇음
								//그럴떄 abstract가 쓰임
	protected int x;
	protected int y;

	public void msg() {
		System.out.println("hahaha");
	}

	public abstract void disp(); //abstract를 붙였으므로 자식에서 반드시 재정의해야함
}
