package ch05.object.quiz;

public class Quiz10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Member m= new Member();
		boolean check=m.login("hong", "1234");
		if(check==true) {
			m.logout("hong");
		}
	}

}
