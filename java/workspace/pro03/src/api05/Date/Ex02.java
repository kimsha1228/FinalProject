package api05.Date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Date 		: 2023. 3. 30.
 * @Author 		: 노건호
 * @Desciption	: 날짜관련 클래스: Calendar
 */

public class Ex02 {

	public static void main(String[] args) {
		Calendar today=Calendar.getInstance(); //Calendar는 static이라 이미 생성되어잇음
		System.out.println(today.toString());//RAW로 찍어보면 다양한 변수가 저장됨.
		
		int year=today.get(Calendar.YEAR);//상수를 반환
		int month=today.get(Calendar.MONTH)+1;//상수를 반환
		int day=today.get(Calendar.YEAR);//상수를 반환
		
		int amPm=today.get(Calendar.AM_PM);
		int hour=today.get(Calendar.HOUR);
		int minute=today.get(Calendar.MINUTE);
		int second=today.get(Calendar.SECOND);
		
		System.out.print(year+"년 ");
		System.out.print(month+"월 ");
		System.out.print(day+"일 ");
		System.out.print(amPm==0?"오전 ":"오후 ");
		System.out.print(hour+"시 ");
		System.out.print(minute+"분 ");
		System.out.println(second+"초");
		
		//방법1
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		System.out.println(sdf.format(date));
		
		//방법2
		Calendar b=Calendar.getInstance();
		Date c=b.getTime();
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		System.out.println(sdf1.format(c));
	}

}
