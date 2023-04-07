package api02.String;

/**
 * @Date : 2023. 3. 29.
 * @Author : 노건호
 * @Desciption : 문자열 관련 클래스- String StringBuffer 차이점
 */
public class Ex04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s1 = "새천년";
		String s2 = "대한민국";
		String s3 = s1;
		String s4 = s2;
		System.out.println(s4.hashCode());
		System.out.println(s3.hashCode());
		System.out.println(s2.hashCode());
		System.out.println(s1.hashCode()); //실질적 데이터의 주소는 공유한다는것을 알수잇댕

		String s5=s1+s2; // 결합해서 새로운 문자열이 되었으므로 메모리공간에 새롭게 만든다
		System.out.println(s5);
		System.out.println(s5.hashCode()+"\n");
		
		StringBuffer sb1= new StringBuffer("우리나라");
		StringBuffer sb2= new StringBuffer("대한민국");
		System.out.println(sb1.hashCode());
		System.out.println(sb2.hashCode());
		
		sb1.append(sb2); //따로 만들지 않고 뒤에 추가해줘서 메모리공간이 절약된다
		System.out.println(sb1);
		System.out.println(sb1.hashCode());
		sb1.append("좋은나라");
		System.out.println(sb1);
		System.out.println(sb1.hashCode());
		sb1.append("만쉐");
		System.out.println(sb1);
		System.out.println(sb1.hashCode());
		System.out.println(sb1.length()); //길이는 14
		System.out.println(sb1.capacity());
		
		StringBuffer b=new StringBuffer("apple");
		System.out.println(b.length());
		System.out.println(b.capacity());//용량 5+16=21byte
		
		//스트링버퍼는 16바이트를 무조건 차지하고 보는지라
		//적은 스트링을 처리할땐 그냥 스트링을 쓰는게 낫다
	}
}
