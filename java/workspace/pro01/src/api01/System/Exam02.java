package api01.System;

import java.util.Date;

/**
 * @Date 		: 2023. 3. 28.
 * @Author 		: 노건호
 * @Desciption	: 패키지02 : 현재시간
 */
public class Exam02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long time=System.currentTimeMillis();
		System.out.println("현재시간을 초단위로:"+time);
		
		long nanotime=System.nanoTime();
		System.out.println("현재시간을 나노초단위로:"+nanotime);
		
		Date date = new Date(time);
		System.out.println(date);
	}
}
