package ch05.object.quiz;

public class Member {
	private String name;
	private String id;
	private String password;
	private int age;

	public boolean login(String id, String password) {
		if (id == "hong" && password == "1234") {
			return true;
		} else {
			return false;
		}
	}

	public void logout(String id) {
		System.out.println(id+" 로그아웃되었습니다");
	}
}
