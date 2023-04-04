package api02.String;

/**
 * @Date 		: 2023. 3. 29.
 * @Author 		: 노건호
 * @Desciption	: String 클래스 그 두번째
 */
public class Ex02 {

	public static void main(String[] args) {
		String a=new String("apple"); 
		String b=new String("apple");
		//a=b는 주소값끼리 비교이기때문에 따로 비교해줘야한다
		System.out.println(a.equals(b));
		
		String x="bananana";
		String y="BANANANA";
		System.out.println("데이터 비교:"+x.equals(y));
		System.out.println("데이터 대소문자 구분X:"+x.equalsIgnoreCase(y));
		
		//대소문자 변환
		String original="Java Programming";
		String lowerCase= original.toLowerCase();
		String upperCase= original.toUpperCase();
		System.out.println(lowerCase+"\n"+upperCase+"\n"+original);
	}

}
