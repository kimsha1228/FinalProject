package api01.System;

import java.io.InputStream;
import java.io.PrintStream;
import java.util.Scanner;
/**
 * @Date 		: 2023. 3. 28.
 * @Author 		: 노건호
 * @Desciption	: System 클래스 - java.lang 패키지
 */

public class Exam01 {

	public static void main(String[] args) {
		PrintStream	p=System.out;
		p.println("API"); //System.out.println
		InputStream asdf=System.in;
		Scanner sc=new Scanner(asdf);
		System.out.println("입력");
		
		while(true) {
			int su=sc.nextInt();
			System.out.println(su);
			
			if(su==5) {
				sc.close();
				//break; //반복 블럭을 빠져나옴
//				return; //main함수를 빠져나옴 즉 종료
				System.exit(0);
			}
		}
	}
}
