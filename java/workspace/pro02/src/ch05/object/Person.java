package ch05.object;

public class Person {
	public String name;
	public int age;
	public float ki;
	
	public void input(String str, int a, float k) {//정보를 전달받아 맴버필드에 데이터할당
		name=str;
		age=a;
		ki=k;
	}	
	
	public void disp() { //가진 정보를 출력하는 함수
		System.out.println(name);
		System.out.println(age);
		System.out.println(ki+"\n");
	}

}
