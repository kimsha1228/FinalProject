package yy;

import xx.AA; //다른 패키지라서 import 해줘야 상속 가능

public class CC extends AA{
	public void disp(){
		
//		System.out.println(x); //private 상속불가
		System.out.println(y); //protected 상속이면 가능
		System.out.println(z); //public
//		System.out.println(su);//default 상속불가
		
	}
}
