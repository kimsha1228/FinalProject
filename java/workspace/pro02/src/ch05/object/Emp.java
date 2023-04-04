package ch05.object;

public class Emp {
	private String name;
	private String phone;
	private String addr;
	public Emp(String name,String phone,String addr) { //생성자
		this.name=name;
		this.phone=phone;
		this.addr=addr;
	}
	public void disp() {
		System.out.println(name);
		System.out.println(phone);
		System.out.println(addr);
	}
}
