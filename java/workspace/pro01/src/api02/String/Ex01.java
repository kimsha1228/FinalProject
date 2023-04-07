package api02.String;

/**
 * @Date : 2023. 3. 29.
 * @Author : 노건호
 * @Desciption : String 문자열 관련 클래스 charAt(),length(),indexOf();
 */
public class Ex01 {

	public static void main(String[] args) {
		// String str="자바프로그래밍"
		String str = new String("자바프로그래밍");
		char ch = str.charAt(5); // 주어진 인덱스의 문자를 리턴한댕
		System.out.println("문자추출: " + ch);

		int length = str.length(); // 문자의 수를 리턴
		System.out.println("문자열 길이:" + length);

		int idx = str.indexOf("프로그래밍");
		System.out.println("문자열 위치: " + idx);// 문자열이 시작되는 위치
		
		//문제) 123456-7891234 성별추철
		String 주민번호="123456-1234567";
		
		if(주민번호.length()==14) {
			int loc=주민번호.indexOf('-'); //만약 없으면 -1을 반환한다
			System.out.println(loc);
			if(loc!=-1) {
				char gender=주민번호.charAt(loc+1);
				
				switch (gender) {
				case '1':case '3':case '5':
					System.out.println("남자입니다");
					break;
				case '2':case '4':case '6':
					System.out.println("여자입니다");
					break;
				default:
					System.out.println("잘못입력");
					break;
				}
			}else {
				System.out.println("해당 문자가 존재하지 않습니다.");
			}
		}else {
			System.out.println("잘못 입력하셨습니댕. 14자리입니댕");
		}
	}

}
