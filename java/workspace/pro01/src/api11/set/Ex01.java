package api11.set;

import java.util.HashSet;
import java.util.Iterator;

import api07.List.Data;

/**
 * @Date : 2023. 3. 31.
 * @Author : 노건호
 * @Desciption : 자료구조 Set- 순서유지가 안된다(마치 보따리안에 이것저것 넣는거마냥)
 * @설명: 중복값 허용이 안됨
 */

public class Ex01 {

	public static void main(String[] args) {
		HashSet<String> set = new HashSet<String>();
		set.add("apple");
		set.add("banana");
		set.add("strawberry");
		set.add("apple"); //중복값 허용 안하므로 이 데이터는 들어가지않아요
		System.out.println(set.toString());

		set.remove("apple");
		System.out.println(set.toString());

		set.add("메론");
		System.out.println(set.toString());
		
		set.clear();
		if(set.isEmpty()) {
			System.out.println(set.toString());
		}
		
		HashSet<Object>	objSet=new HashSet<Object>();
		objSet.add(10);
		objSet.add(24.5);
		objSet.add((String)"apple");
		System.out.println(objSet.toString());
		
		//해쉬셋 안에 남는것들을 뽑아내는 반복문은.. Iterator 클래스
		Iterator<Object> iter=objSet.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.toString());
			System.out.println(iter.next());
		}
		
		System.out.println();
		
		//커스텀 자료형 가져와서 해쉬셋으로 집어넣어보기
		HashSet<Data> dataSet=new HashSet<Data>();
		dataSet.add(new Data(1, 2));
		dataSet.add(new Data(11, 22));
		dataSet.add(new Data(100, 200));
		System.out.println(dataSet.toString());
		
		//하나하나씩 뽑는다
		Iterator<Data> iter1=dataSet.iterator();
		while(iter1.hasNext()) {
			Data d=iter1.next();
			d.yonsan();
			d.disp();
		}
		//이렇게 추가할수도잇다
		Data abc=new Data(88,99);
		dataSet.add(abc);
		System.out.println(dataSet);
		
		//dataSet.remove(new Data(88,99)); 이런식으로는 제거가 안된다
		dataSet.remove(abc);
		System.out.println(dataSet);
	}
}
