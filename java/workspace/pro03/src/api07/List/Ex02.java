package api07.List;

import java.util.ArrayList;

/**
 * @Date 		: 2023. 3. 30.
 * @Author 		: 노건호
 * @Desciption	:
 */
public class Ex02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<String> list = new ArrayList<String>();
		list.add("Java");
		list.add("Oracle");
		list.add("JSP");
		list.add("HTML");
		list.add("CSS");
		System.out.println(list.toString());
		
		//추가 - 맨마지막
		//특정번지에 추가하기
		//수정 또는 교체
		//삭제
		list.add(1, "바나나");
		System.out.println(list.toString());
		
		list.set(0, "자바");
		System.out.println(list.toString());
		
		list.remove(1);
		System.out.println(list.toString());

	}
}
