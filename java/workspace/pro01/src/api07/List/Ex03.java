package api07.List;

import java.util.Date;
import java.util.ArrayList;

/**
 * @Date 		: 2023. 3. 30.
 * @Author 		: 노건호
 * @Desciption	: ArrayList에 커스텀 클래스 이리저리 다뤄보기
 */
public class Ex03 {
	public static void main(String[] args) {
		Data a = new Data(1, 2);
		Data b = new Data(3, 4);
		Data c = new Data(5, 6);

		ArrayList<Data> list = new ArrayList<Data>();
		list.add(a);
		list.add(b);
		list.add(c);

		for (int i = 0; i < list.size(); i++) {
			Data data = list.get(i);
			data.yonsan();
			data.disp();
		}
		System.out.println();
		list.add(new Data(55, 66));
		list.add(1, new Data(77, 88));
		list.set(0, new Data(99, 11));

		for (int i = 0; i < list.size(); i++) {
			Data data = list.get(i);
			data.yonsan();
			data.disp();
		}
		
		list.remove(3);
		System.out.println(list.toString());//toString을 오버라이딩해야 우리가 원하던대로 나옴
		System.out.println(list);
		
		Date today=new Date();
		System.out.println(today.toString());
		System.out.println(today); //아무것도 안 적으면 자동적으로 toString()을 호출해준다
	}
}
