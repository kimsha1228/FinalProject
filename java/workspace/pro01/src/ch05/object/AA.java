package ch05.object;

public class AA {
	private int a;
	private static int b;
	
	public int x;
	public static int y;
	
	public static final int V=25;
	public float PI=3.141592f;
	
	public 	void sub() {
		final int SU=10; //지역 final, 이 블락내에서만 유지되며 변경불가
		System.out.println(SU);
		
		//SU=20; //에러가 뜬다
		//PI=0;
		//V=25;
		System.out.println(PI);
		System.out.println(V);
	}
	
	public void input(int a, int b) {
		this.a=a;
		//this.b=b; //b는 static으로 선언되었기 때문에다른 메모리공간에 있고 this로 접근이 불가능하다.
		AA.b=b; //대신 클래스명으로 접근 가능하다.
	}
	
	public void disp() {
		
	}
}
