package xx;

public class BB {
	public static void main(String[] args) {
		AA a=new AA();
//		System.out.println(a.x); //private는 자기자신내에서만 쓸수잇음
		System.out.println(a.y); //protected는 동일패키지에서는 가능하지만 다른 패키지에선 private처럼 동작
		System.out.println(a.z); //어느곳에서든 가능
		System.out.println(a.su);//동일패키지에선 제한없음
	}
}
