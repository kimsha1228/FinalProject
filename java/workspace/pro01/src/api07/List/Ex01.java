package api07.List;

import java.util.ArrayList;

/**
 * @Date : 2023. 3. 30.
 * @Author : 노건호
 * @Desciption : List - ArrayList List 인터페이스를 구현하고 객체들을 모아서 처리하는 느낌 일반 배열과는 다르게
 *             크기가 유동적이다 객체 추가 삭제 수정이 가능하다 
 *             서로 다른 클래스의 객체를 저장할수 있다.
 */
public class Ex01 {

	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("Java");
		list.add("Oracle");
		list.add("JSP");
		list.add("HTML");
		list.add("CSS");

		String str = list.get(2);
		System.out.println(str);
		System.out.println(list.toString());

		for (int i = 0; i < list.size(); i++) {
			String string = list.get(i);
			System.out.println(string);
		}
		System.out.println();

		ArrayList<Integer> su = new ArrayList<Integer>();
		su.add(10);// 내부적으로는 int를 자동으로 Integer로 변환해서 보냄
		su.add(20);
		su.add(30);

		System.out.println(su.toString());

		// 여러개의 자료형을 넣어보기
		ArrayList<Object> value = new ArrayList<Object>(); // 모든 클래스는 Object를 상속하기때문
		value.add(10);
		value.add(24.5f);
		value.add("apple");
		value.add(20);
		System.out.println(value.toString());

		// 0번지의 데이터를 Integer로뽑으려면?
//		Object a=value.get(0); //대신 이러면 Integer의 함수를 못 씀
		Integer a = (Integer) value.get(0);
		String b = (String) value.get(2);

	}
}
