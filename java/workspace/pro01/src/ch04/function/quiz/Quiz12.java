package ch04.function.quiz;

public class Quiz12 {

	public static void main(String[] args) {
		boolean result =login("hong","1234");
		
		if(result) {
			System.out.println("로그인 되었습니다.");
			logout("hong");
		}else {
			System.out.println("id와 password가 올바르지 않습니다");
		}
	}

	public static boolean login(String string, String string2) {
		if(string=="hong"&&string2=="1234") {
			return true;
		}else {
			return false;
		}
	}

	public static void logout(String string) {
		System.out.println("로그아웃 되었습니다.");
	}
}
