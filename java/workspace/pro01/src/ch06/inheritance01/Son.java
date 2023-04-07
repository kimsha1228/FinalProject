package ch06.inheritance01;

public class Son extends Parents{ //x,y,z,sub()
	private int a;
	private int b;
	
	public void input(int x,int y,char z, int a, int b) {
		super.x=x;
		super.y=y;
		super.z=z;
		
		this.a=a;
		this.b=b;
	}
	
	public void disp() {
		super.sub();
		System.out.println(super.x);
		System.out.println(super.y);
		System.out.println(super.z);
		
	}
}
