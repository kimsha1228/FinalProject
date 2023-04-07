package api12.Map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import api07.List.Data;

/**
 * @Date : 2023. 3. 31.
 * @Author : 노건호
 * @Desciption : Map 방식으로 커스텀 클래스 써보기
 */
public class Ex03 {

	public static void main(String[] args) {
		Data a = new Data(10, 20);
		Data b = new Data(30, 40);
		Data c = new Data(50, 60);

		HashMap<String, Data> map = new HashMap<String, Data>();
		map.put("one", a);
		map.put("two", b);
		map.put("three", c);
		
		Data data=map.get("two");
		data.yonsan();
		data.disp();

//		Set<String> set=map.keySet();
//		Iterator<String> iter=set.iterator();
		
		//위에 두줄을 한줄로
		Iterator<String> iter=map.keySet().iterator();
		while(iter.hasNext()) {
			Data obj=map.get(iter.next());
			obj.yonsan();
			obj.disp();
		}
	}
}
