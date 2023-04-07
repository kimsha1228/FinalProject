package api02.String;

import java.util.Scanner;

/**
 * @Date : 2023. 3. 29.
 * @Author : 노건호
 * @Desciption : String 클래스 그 세번째 replace(),trim(),substring()
 */
public class Ex03 {

	public static void main(String[] args) {
		String oldStr = "자바는 객체지향 언어입니다.";
		// 일부 문자열을 치환해주는 replace 함수
		System.out.println(oldStr.replace("자바", "JAVA"));
		System.out.println("원본:" + oldStr);

		// 문자열 앞뒤공백을 제거함으로서 오류를 방지할수잇음
		String str = "    자바       프로그래밍     ";
		System.out.println("공백이포함된 원본:" + str);
		System.out.println("앞뒤공백 제거:" + str.trim());

		// 문자열 을 몇번째 인덱스부터 잘라내기
		String abc = "How are you?";
		System.out.println("문자열 잘라내기: " + abc.substring(2));
		System.out.println("문자열 잘라내기: " + abc.substring(2, 8));

//		문자열 기본타입(byte~~double)변환
		Scanner sc = new Scanner(System.in);
		System.out.println(sc.nextInt()); // 문자열 -숫자
		
		String xyz="1234";//문자열 보통 뷰단으로 넘어온다 String xyz=<input type="text" name="su/>
		String b="20"; //실제로는 view에서 넘어온다?
		int value=Integer.parseInt(xyz);
		int value2=Integer.parseInt(b);
		int sum=value+value2;
		System.out.println(sum);

		//기본타입을 문자열 변환
		String ivar=String.valueOf(sum);//view "30"
		String fvar=String.valueOf(10.5f);//view에선 "10.5f"
		String bvar=String.valueOf(true);//view에선 true가 보내짐
		sc.close();
		
		//관심사: 인공지능, 영화, 음악
		String h="인공지능, 영화, 음악";
		String[] arr=h.split(",");
		for(int i=0;i<arr.length;i++) {
			System.out.println(arr[i]);
		}
	}

}
