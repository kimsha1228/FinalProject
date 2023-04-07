package api12.Map;

import java.util.HashMap;
import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", "abc");
		map.put("pwd", 123);//패스워드?
		
		Scanner sc=new Scanner(System.in);
		
		while(true) {
			System.out.print("아이디입력:");
			String vid=sc.next();
			
			System.out.print("비밀번호(정수형):");
			int vpwd=sc.nextInt();
			
			String did=(String) map.get("id");
			int dpwd=(Integer) map.get("pwd");
			
			if(vid.equals(did)) {//아이디 같니?
				if(vpwd==dpwd) {//비번 같니?
					System.out.println("로그인 성공");
					sc.close();
					break;
				}else {
					System.out.println("비밀번호가 틀렸습니다.");
				}
			}else {
				System.out.println("해당 아이디가 없습니다.");
			}
		}
	}

}
