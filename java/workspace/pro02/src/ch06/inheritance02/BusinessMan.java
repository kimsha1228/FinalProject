package ch06.inheritance02;

public class BusinessMan extends Man {
	private String company;
	private String position;

	public BusinessMan(String name, String company, String position) {
		super.name = name;
		this.company = company;
		this.position = position;
	}

	public void info() {
		empName();
		System.out.println("회사이름: " + company);
		System.out.println("직금: " + position);
	}
}
