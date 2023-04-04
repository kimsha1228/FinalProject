package ch03.array;

/**
 * @Date 		: 2023. 3. 22.
 * @Author 		: 노건호
 * @Desciption	: 배열 - 동일한 데이터를 다루는 기본 자료구조
 * 						각각은 index값을 갖는다
 */
public class Exam27 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char[] ch=new char[] {'A','B','C'};
		System.out.println(ch[0]);
		
		int[] arr=new int[] {77,88,99,1,2,3};
		for(int i=0;i<arr.length;i++) {
			++arr[i];
			System.out.println(arr[i]+"\t");
		}
		
		// 배열의 단점: 추가 삭제가 안됨, java 입장에서 동일한 자료형 처리가 별로 필요없다
		String[] str=new String[] {"apple","hi","힘들어","재미나","졸루"};
		
		for(int i=0;i<str.length;i++) {
			System.out.println(str[i]);
		}
	}

}
