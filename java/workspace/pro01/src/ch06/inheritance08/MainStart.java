package ch06.inheritance08;

/**
 * @Date : 2023. 3. 28.
 * @Author : 노건호
 * @Desciption : 다형성(업 캐스팅, 다운캐스팅)
 */
public class MainStart {

	public static void main(String[] args) {
		Person p = new Person();
		p.setMessage("화요일");
		System.out.println(p.getMessage() + "\n");
		p.aa();
		p.bb();
		p.cc();

		Student s = new Student();
		s.setMessage("3월 마지막주");
		s.aa();
		s.bb();
		s.cc();
		s.xx();
		s.yy();
		s.zz();
		System.out.println();

		byte a = 10;
		int b = a;// 큰 자료형은 작은 자료형을 담을수잇다(묵시적 업캐스팅)
		int c = 10;
		byte d = (byte) c;// 작은 자료형은 큰 자료형을 담을수없어서 다운캐스팅을 선언해줘야만한다

		// 상속: 부모>자식
		Person person = new Student(); // 업캐스팅
		person.setMessage("자식함수 제어");
		person.aa();
		person.bb();
		person.cc();
//		person.xx();//자식거라서 못 씀

//		Student stu=(Student) new Person();
//		stu.setMessage("abc"); //에러가뜬다

		Student stu = (Student) person;// 다운캐스팅 (이미 업캐스팅 된거는 다운캐스팅이 먹힘)
		stu.setMessage("abc");
	}
}
