package ch05.object;

/**
 * @Date : 2023. 3. 27.
 * @Author : 노건호
 * @Desciption : 지정예약어 - 변수, 함수
 * @:static,final,static final
 */

public class BB {
	private int x = 10;
	private static int y = 20;
	private final int SU = 55;
	private static final int VALUE = 77;

	public static void banana() { // static 함수, 현재 static변수는 y와 VALUE 두개
//		스태틱은 시작할때부터 메모리에 올라와야해서 
//		메모리에 올라오지 않은 맴버,지역변수는 사용불가하다
//		즉 static 함수는 static 변수만 가져올수 있다.
//		System.out.println(x); // this.x  //에러
		System.out.println(y); // BB.y
//		System.out.println(SU);// this.SU //에러
		System.out.println(VALUE);// BB.VALUE

//		apple();//역시 static이 아니라 불가능
		sub(); //sub는 static이라 가능
	}

	public static void sub() { //static 함수
		
	}
	public void apple() { // 맴버함수

	}
	public final void aa() { // 맴버함수

	}
	public static final void b() { // static함수

	}

	public void disp() {
		System.out.println(x); // this.x
		System.out.println(y); // BB.y
		System.out.println(SU);// this.SU
		System.out.println(VALUE);// BB.VALUE

//		SU=100;//final 변경불가
//		VALUE=200;//final 변경불가;
		x++;
		y++;
	}
}
