package ch06.inheritance.quiz02;

public class StudentAddress extends Student {
	private String phone;
	private String addr;

	public StudentAddress(int hakbunho, String name, String major, String phone, String addr) {
		super(hakbunho, name, major);
		this.phone = phone;
		this.addr = addr;
	}
	public void disp() {
		System.out.println("학번:"+hakbunho);
		System.out.println("이름:"+name);
		System.out.println("학과:"+major);
		System.out.println("전화번호:"+phone);
		System.out.println("주소:"+addr);
	}
}
