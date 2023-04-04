package api12.Map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/**
 * @Date 		: 2023. 3. 31.
 * @Author 		: 노건호
 * @Desciption	: Map- Key와 value로 구성되고 Key 중복X value 중복O
 */
public class Ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("spring", "봄");
		map.put("summer","여름");
		map.put("fall", "가을");
		map.put("winter","겨울");
		map.put("spring", "봄날"); //키값중복일경우 덮어씌워짐
		System.out.println(map.get("spring"));
		System.out.println(map.toString());
		
		//키값만 싹 뽑아오기
		System.out.println(map.keySet());
		Set<String> set=map.keySet();
		System.out.println(set.toString());
		
		//모든 값 뽑아먹기
		Iterator<String> iter=set.iterator();
		while(iter.hasNext()) {
			String key=iter.next();
			String value=map.get(key);
			System.out.println(key+"\t"+value);
		}
	}

}
