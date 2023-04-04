package yy;

/**
 * @Date 		: 2023. 3. 28.
 * @Author 		: 노건호
 * @Desciption	: 패키지의 사용
 */

import xx.AA;

public class DD {
	public static void main(String[] args) {
		AA a=new AA();
		
//		System.out.println(a.x); //private는 자기자신내에서만 쓸수잇음
//		System.out.println(a.y); //protected: 다른 패키지라 private처럼 동작
		System.out.println(a.z); //어느곳에서든 가능
//		System.out.println(a.su);//다른 패키지라 접근 불가
		
	}
}
