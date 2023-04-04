package api05.Date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Date 		: 2023. 3. 29.
 * @Author 		: 노건호
 * @Desciption	: 날짜관련 클래스 - Date, SimpleDateFormat
 */
public class Ex01 {

	public static void main(String[] args) throws ParseException {
		
		Date today=new Date();
		System.out.println("오늘날짜:"+today);
		
		//더이상 쓰이지않는 방식
		System.out.print(today.getYear()+"년도 ");
		System.out.print(today.getMonth()+"월 ");
		System.out.print(today.getDate()+"일 ");
		System.out.print(today.getHours()+"시 ");
		System.out.print(today.getMinutes()+"분 ");
		System.out.println(today.getSeconds()+"초");
		
		//SimpleDateFormat을 이용해서 원하는 패턴으로 출력
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
		String a=sdf1.format(today);
		System.out.println(a);
		
		SimpleDateFormat sdf2=new SimpleDateFormat("yy년 MM월 dd일 E요일");
		String b=sdf2.format(today);
		System.out.println(b);
		
		SimpleDateFormat sdf3=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String c=sdf3.format(today);
		System.out.println(c+"\n");
		
		//문자열을 날짜로 바꾸기 
		String strDate="1990-12-25"; //<input type="date"/> 1222년 12월 25일
		System.out.println("넘어온 데이터:"+strDate);
		Date date=sdf1.parse(strDate); //원래있던 SimpleDateFormat sdf1에 있는 parse 함수를 통해 Date객체에 변환해서 넣어줌
		System.out.println(date.toString()+"\t"+sdf1.format(date));
		
		//날짜 - 문자열 toString(),sdf1.format(Date);
	}
}
