package api01.System;

public class Exam03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String osName=System.getProperty("os.name");
		String userName=System.getProperty("user.name");
		String userHome=System.getProperty("user.home");
		String javaVersion=System.getProperty("java.version");
		
		System.out.println("운영체제 이름:"+osName);
		System.out.println("사용자 이름:"+userName);
		System.out.println("사용자 홈디렉토리 이름:"+userHome);
		System.out.println("자바버전:"+javaVersion);
	}

}
